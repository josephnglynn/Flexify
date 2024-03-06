package com.presley.flexify

import android.Manifest
import android.annotation.SuppressLint
import android.app.*
import android.content.ActivityNotFoundException
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.media.MediaPlayer
import android.net.Uri
import android.os.*
import android.util.Log
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat


@RequiresApi(Build.VERSION_CODES.O)
class TimerService : Service() {

    private lateinit var timerHandler: Handler

    private var timerRunnable: Runnable? = null
    private var mediaPlayer: MediaPlayer? = null
    private var vibrator: Vibrator? = null
    private val binder = LocalBinder()
    private var currentDescription = ""

    var secondsLeft: Int = 0
    var secondsTotal: Int = 0
    var running = false

    override fun onBind(intent: Intent): IBinder? {
        return binder
    }

    inner class LocalBinder : Binder() {
        fun getService(): TimerService = this@TimerService
    }

    private val stopReceiver =
        object : BroadcastReceiver() {
            override fun onReceive(context: Context?, intent: Intent?) {
                Log.d("TimerService", "Received stop broadcast intent")
                running = false
                secondsLeft = 0
                secondsTotal = 0
                timerHandler.removeCallbacks(timerRunnable!!)
                mediaPlayer?.stop()
                vibrator?.cancel()
                val tickIntent = Intent(MainActivity.TICK_BROADCAST)
                tickIntent.putExtra("secondsLeft", 0)
                tickIntent.putExtra("secondsTotal", 0)
                sendBroadcast(tickIntent)
                val notificationManager = NotificationManagerCompat.from(this@TimerService)
                notificationManager.cancel(ONGOING_ID)
                stopForeground(STOP_FOREGROUND_REMOVE)
                stopSelf()
            }
        }

    private val addReceiver =
        object : BroadcastReceiver() {
            override fun onReceive(context: Context?, intent: Intent?) {
                Log.d("TimerService", "Received add broadcast intent")
                if (running) {
                    secondsLeft += 60
                    secondsTotal += 60
                } else {
                    secondsLeft = 60
                    secondsTotal = 60
                }
                updateNotification(secondsLeft)
                mediaPlayer?.stop()
                vibrator?.cancel()
                startTimer()
            }
        }

    @SuppressLint("UnspecifiedRegisterReceiverFlag")
    override fun onCreate() {
        super.onCreate()
        timerHandler = Handler(Looper.getMainLooper())
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            applicationContext.registerReceiver(
                stopReceiver, IntentFilter(STOP_BROADCAST),
                Context.RECEIVER_NOT_EXPORTED
            )
            applicationContext.registerReceiver(
                addReceiver, IntentFilter(ADD_BROADCAST),
                Context.RECEIVER_NOT_EXPORTED
            )
        } else {
            applicationContext.registerReceiver(stopReceiver, IntentFilter(STOP_BROADCAST))
            applicationContext.registerReceiver(addReceiver, IntentFilter(ADD_BROADCAST))
        }
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        timerRunnable?.let { timerHandler.removeCallbacks(it) }
        secondsLeft = (intent?.getIntExtra("milliseconds", 0) ?: 0) / 1000
        currentDescription = intent?.getStringExtra("description").toString()
        secondsTotal = secondsLeft
        startForeground(ONGOING_ID, getProgress(secondsLeft).build())
        battery()
        Log.d("TimerService", "onStartCommand seconds=$secondsLeft")
        startTimer()
        running = true
        return START_STICKY
    }

    private fun startTimer() {
        timerRunnable?.let { timerHandler.removeCallbacks(it) }
        timerRunnable = object : Runnable {
            override fun run() {
                val intent = Intent(MainActivity.TICK_BROADCAST)
                if (secondsLeft > 0) {
                    intent.putExtra("secondsLeft", secondsLeft - 1)
                    intent.putExtra("secondsTotal", secondsTotal)
                    secondsLeft--
                    updateNotification(secondsLeft)
                    timerHandler.postDelayed(this, 1000)
                } else {
                    vibrate()
                    playSound()
                    notifyFinished()
                    running = false
                    secondsLeft = 0
                    secondsTotal = 0
                    intent.putExtra("secondsLeft", 0)
                    intent.putExtra("secondsTotal", 0)
                }
                sendBroadcast(intent)
            }
        }
        timerHandler.postDelayed(timerRunnable!!, 1000)
    }

    override fun onDestroy() {
        super.onDestroy()
        timerHandler.removeCallbacks(timerRunnable!!)
        applicationContext.unregisterReceiver(stopReceiver)
        applicationContext.unregisterReceiver(addReceiver)
        mediaPlayer?.stop()
        mediaPlayer?.release()
        vibrator?.cancel()
    }

    @SuppressLint("BatteryLife")
    fun battery() {
        val powerManager =
            applicationContext.getSystemService(Context.POWER_SERVICE) as PowerManager
        val ignoring =
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M)
                powerManager.isIgnoringBatteryOptimizations(
                    applicationContext.packageName
                )
            else true
        if (ignoring) return
        val intent = Intent(android.provider.Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
        intent.data = Uri.parse("package:" + applicationContext.packageName)
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        try {
            applicationContext.startActivity(intent)
        } catch (e: ActivityNotFoundException) {
            Toast.makeText(
                applicationContext,
                "Requests to ignore battery optimizations are disabled on your device.",
                Toast.LENGTH_LONG
            ).show()
        }
    }

    private fun playSound() {
        mediaPlayer = MediaPlayer.create(applicationContext, R.raw.argon)
        mediaPlayer?.start()
        mediaPlayer?.setOnCompletionListener { vibrator?.cancel() }
    }

    private fun getProgress(timeLeftInSeconds: Int): NotificationCompat.Builder {
        val channelId = "timer_channel"
        val contentIntent = Intent(this, MainActivity::class.java)
        val contentPending = PendingIntent.getActivity(
            this,
            0,
            contentIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        val stopBroadcast = Intent(STOP_BROADCAST)
        stopBroadcast.setPackage(applicationContext.packageName)
        val stopPending =
            PendingIntent.getBroadcast(
                applicationContext,
                0,
                stopBroadcast,
                PendingIntent.FLAG_IMMUTABLE
            )
        val addBroadcast =
            Intent(ADD_BROADCAST).apply { setPackage(applicationContext.packageName) }
        val addPending =
            PendingIntent.getBroadcast(
                applicationContext,
                0,
                addBroadcast,
                PendingIntent.FLAG_MUTABLE
            )

        val notificationBuilder = NotificationCompat.Builder(this, channelId)
            .setContentTitle(currentDescription)
            .setContentText(formatTime(timeLeftInSeconds))
            .setSmallIcon(R.drawable.baseline_timer_24)
            .setProgress(secondsTotal, timeLeftInSeconds, false)
            .setContentIntent(contentPending)
            .setCategory(NotificationCompat.CATEGORY_PROGRESS)
            .setAutoCancel(false)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setOngoing(true)
            .setDeleteIntent(stopPending)
            .addAction(R.drawable.ic_baseline_stop_24, "Stop", stopPending)
            .addAction(R.drawable.ic_baseline_stop_24, "Add 1 min", addPending)

        val notificationManager = NotificationManagerCompat.from(this)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                channelId,
                "Timer Channel",
                NotificationManager.IMPORTANCE_DEFAULT
            )
            channel.setSound(null, null)
            channel.setBypassDnd(true)
            channel.enableVibration(false)
            channel.description = "Ongoing progress of rest timers."
            channel.lockscreenVisibility = Notification.VISIBILITY_PUBLIC
            notificationManager.createNotificationChannel(channel)
        }

        return notificationBuilder
    }

    private fun vibrate() {
        val pattern =
            longArrayOf(0, 1000, 1000, 1000, 1000, 1000)
        vibrator = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            val vibratorManager =
                getSystemService(Context.VIBRATOR_MANAGER_SERVICE) as VibratorManager
            vibratorManager.defaultVibrator
        } else {
            @Suppress("DEPRECATION")
            getSystemService(VIBRATOR_SERVICE) as Vibrator
        }
        vibrator!!.vibrate(VibrationEffect.createWaveform(pattern, 2))
    }

    private fun notifyFinished() {
        val channelId = "finished_channel"
        val notificationManager = NotificationManagerCompat.from(this)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel =
                NotificationChannel(
                    channelId,
                    "Timer Finished Channel",
                    NotificationManager.IMPORTANCE_HIGH
                )
            channel.setSound(null, null)
            channel.setBypassDnd(true)
            channel.enableVibration(false)
            channel.description = "Plays an alarm when a rest timer completes."
            channel.lockscreenVisibility = Notification.VISIBILITY_PUBLIC
            notificationManager.createNotificationChannel(channel)
        }

        val contentIntent = Intent(this, MainActivity::class.java)
        val contentPending = PendingIntent.getActivity(
            this,
            0,
            contentIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        val stopBroadcast = Intent(STOP_BROADCAST)
        stopBroadcast.setPackage(applicationContext.packageName)
        val pendingStop =
            PendingIntent.getBroadcast(
                applicationContext,
                0,
                stopBroadcast,
                PendingIntent.FLAG_IMMUTABLE
            )
        val addBroadcast =
            Intent(ADD_BROADCAST).apply { setPackage(applicationContext.packageName) }
        val addPending =
            PendingIntent.getBroadcast(
                applicationContext,
                0,
                addBroadcast,
                PendingIntent.FLAG_MUTABLE
            )

        val builder = NotificationCompat.Builder(this, channelId)
            .setContentTitle("Timer finished")
            .setContentText(currentDescription)
            .setSmallIcon(R.drawable.baseline_timer_24)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setCategory(NotificationCompat.CATEGORY_ALARM)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setContentIntent(contentPending)
            .setAutoCancel(true)
            .setDeleteIntent(pendingStop)
            .addAction(R.drawable.ic_baseline_stop_24, "Add 1 min", addPending)

        if (ActivityCompat.checkSelfPermission(
                this,
                Manifest.permission.POST_NOTIFICATIONS
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            return
        }
        notificationManager.notify(FINISHED_ID, builder.build())
    }

    private fun updateNotification(seconds: Int) {
        val notificationManager = NotificationManagerCompat.from(this)
        val notification = getProgress(seconds)
        if (ActivityCompat.checkSelfPermission(
                this,
                Manifest.permission.POST_NOTIFICATIONS
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            return
        }
        notificationManager.notify(ONGOING_ID, notification.build())
    }

    private fun formatTime(timeInSeconds: Int): String {
        val minutes = timeInSeconds / 60
        val seconds = timeInSeconds % 60
        return String.format("%02d:%02d", minutes, seconds)
    }

    companion object {
        const val STOP_BROADCAST = "stop-timer-event"
        const val ADD_BROADCAST = "add-timer-event"
        const val ONGOING_ID = 1
        const val FINISHED_ID = 1
    }
}

