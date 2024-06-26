import 'package:drift/drift.dart';
import 'package:flexify/database/database.dart';
import 'package:flexify/main.dart';
import 'package:flexify/plan/plan_state.dart';
import 'package:flexify/settings_state.dart';
import 'package:flexify/unit_selector.dart';
import 'package:flexify/utils.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditGraphPage extends StatefulWidget {
  final String name;

  const EditGraphPage({required this.name, super.key});

  @override
  createState() => _EditGraphPageState();
}

class _EditGraphPageState extends State<EditGraphPage> {
  late TextEditingController _nameController;
  final TextEditingController _minutesController = TextEditingController();
  final TextEditingController _secondsController = TextEditingController();
  final TextEditingController _maxSetsController = TextEditingController();

  bool _cardio = false;
  String? _unit;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);

    final settings = context.read<SettingsState>();

    (db.gymSets.select()
          ..where((tbl) => tbl.name.equals(widget.name))
          ..limit(1))
        .getSingle()
        .then(
          (value) => setState(() {
            _cardio = value.cardio;
            _unit = value.unit;

            if (value.restMs != null) {
              final duration = Duration(milliseconds: value.restMs!);
              _minutesController.text = duration.inMinutes.toString();
              _secondsController.text = (duration.inSeconds % 60).toString();
            }

            if (value.maxSets != null)
              _maxSetsController.text = value.maxSets.toString();
            if (_cardio && (_unit == 'kg' || _unit == 'lb'))
              _unit = settings.cardioUnit ?? 'km';
            else if (!_cardio && (_unit == 'km' || _unit == 'mi'))
              _unit = settings.strengthUnit ?? 'kg';
          }),
        );
  }

  @override
  dispose() {
    _nameController.dispose();
    _minutesController.dispose();
    _secondsController.dispose();
    _maxSetsController.dispose();
    super.dispose();
  }

  Future<int> _getCount() async {
    final result = await (db.gymSets.selectOnly()
          ..addColumns([db.gymSets.name.count()])
          ..where(db.gymSets.name.equals(_nameController.text)))
        .getSingle();
    return result.read(db.gymSets.name.count()) ?? 0;
  }

  Future<bool> _mixedUnits() async {
    final result = await (db.gymSets.selectOnly(distinct: true)
          ..addColumns([db.gymSets.unit])
          ..where(db.gymSets.name.equals(_nameController.text)))
        .get();
    return result.length > 1;
  }

  Future<void> _doUpdate() async {
    final minutes = int.tryParse(_minutesController.text);
    final seconds = int.tryParse(_secondsController.text);

    Duration? duration;
    if (minutes != null && minutes > 0 || seconds != null && seconds > 0)
      duration = Duration(
        minutes: minutes ?? 0,
        seconds: seconds ?? 0,
      );

    await (db.gymSets.update()..where((tbl) => tbl.name.equals(widget.name)))
        .write(
      GymSetsCompanion(
        name: Value(_nameController.text),
        cardio: Value(_cardio),
        unit: _unit != null ? Value(_unit!) : const Value.absent(),
        restMs: Value(duration?.inMilliseconds),
        maxSets: Value(int.tryParse(_maxSetsController.text)),
      ),
    );

    await db.customUpdate(
      'UPDATE plans SET exercises = REPLACE(exercises, ?, ?)',
      variables: [
        Variable.withString(widget.name),
        Variable.withString(_nameController.text),
      ],
      updates: {db.plans},
    );

    if (!mounted) return;
    context.read<PlanState>().updatePlans(null);
  }

  _save() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name cannot be empty.')),
      );
      Navigator.pop(context);
      return;
    }

    final count = await _getCount();

    if (count > 0 && widget.name != _nameController.text && mounted)
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update conflict'),
            content: Text(
              'Your new name exists already for $count records. Are you sure?',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('Confirm'),
                onPressed: () async {
                  Navigator.pop(context);
                  await _doUpdate();
                },
              ),
            ],
          );
        },
      );
    else if (await _mixedUnits() && mounted)
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Units conflict'),
            content: const Text(
              'Not all of your records are the same unit. Are you sure?',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('Confirm'),
                onPressed: () async {
                  Navigator.pop(context);
                  await _doUpdate();
                },
              ),
            ],
          );
        },
      );
    else
      await _doUpdate();

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit ${widget.name.toLowerCase()}"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: material.Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "New name"),
              textCapitalization: TextCapitalization.sentences,
            ),
            TextField(
              controller: _maxSetsController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "Max sets"),
              keyboardType: TextInputType.number,
              onTap: () => selectAll(_maxSetsController),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minutesController,
                    textInputAction: TextInputAction.next,
                    decoration:
                        const InputDecoration(labelText: "Rest minutes"),
                    keyboardType: material.TextInputType.number,
                    onTap: () => selectAll(_minutesController),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextField(
                    controller: _secondsController,
                    textInputAction: TextInputAction.next,
                    decoration:
                        const InputDecoration(labelText: "Rest seconds"),
                    keyboardType: material.TextInputType.number,
                    onTap: () {
                      selectAll(_secondsController);
                    },
                  ),
                ),
              ],
            ),
            if (_unit != null)
              UnitSelector(
                value: _unit!,
                cardio: _cardio,
                onChanged: (value) {
                  setState(() {
                    _unit = value;
                  });
                },
              ),
            ListTile(
              leading: _cardio
                  ? const Icon(Icons.sports_gymnastics)
                  : const Icon(Icons.fitness_center),
              title: _cardio ? const Text('Cardio') : const Text('Strength'),
              onTap: () {
                setState(() {
                  _cardio = !_cardio;
                  if (_cardio)
                    _unit = _unit == 'kg' ? 'km' : 'mi';
                  else
                    _unit = _unit == 'km' ? 'kg' : 'lb';
                });
              },
              trailing: Switch(
                value: _cardio,
                onChanged: (value) => setState(() {
                  _cardio = value;
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _save,
        tooltip: "Update all records for this exercise",
        child: const Icon(Icons.save),
      ),
    );
  }
}
