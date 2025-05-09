// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class Plans extends Table with TableInfo<Plans, PlansData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Plans(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> sequence = GeneratedColumn<int>(
      'sequence', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<String> exercises = GeneratedColumn<String>(
      'exercises', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> days = GeneratedColumn<String>(
      'days', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, sequence, exercises, days, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plans';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlansData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlansData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sequence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sequence']),
      exercises: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercises'])!,
      days: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}days'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
    );
  }

  @override
  Plans createAlias(String alias) {
    return Plans(attachedDatabase, alias);
  }
}

class PlansData extends DataClass implements Insertable<PlansData> {
  final int id;
  final int? sequence;
  final String exercises;
  final String days;
  final String? title;
  const PlansData(
      {required this.id,
      this.sequence,
      required this.exercises,
      required this.days,
      this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || sequence != null) {
      map['sequence'] = Variable<int>(sequence);
    }
    map['exercises'] = Variable<String>(exercises);
    map['days'] = Variable<String>(days);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    return map;
  }

  PlansCompanion toCompanion(bool nullToAbsent) {
    return PlansCompanion(
      id: Value(id),
      sequence: sequence == null && nullToAbsent
          ? const Value.absent()
          : Value(sequence),
      exercises: Value(exercises),
      days: Value(days),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
    );
  }

  factory PlansData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlansData(
      id: serializer.fromJson<int>(json['id']),
      sequence: serializer.fromJson<int?>(json['sequence']),
      exercises: serializer.fromJson<String>(json['exercises']),
      days: serializer.fromJson<String>(json['days']),
      title: serializer.fromJson<String?>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sequence': serializer.toJson<int?>(sequence),
      'exercises': serializer.toJson<String>(exercises),
      'days': serializer.toJson<String>(days),
      'title': serializer.toJson<String?>(title),
    };
  }

  PlansData copyWith(
          {int? id,
          Value<int?> sequence = const Value.absent(),
          String? exercises,
          String? days,
          Value<String?> title = const Value.absent()}) =>
      PlansData(
        id: id ?? this.id,
        sequence: sequence.present ? sequence.value : this.sequence,
        exercises: exercises ?? this.exercises,
        days: days ?? this.days,
        title: title.present ? title.value : this.title,
      );
  PlansData copyWithCompanion(PlansCompanion data) {
    return PlansData(
      id: data.id.present ? data.id.value : this.id,
      sequence: data.sequence.present ? data.sequence.value : this.sequence,
      exercises: data.exercises.present ? data.exercises.value : this.exercises,
      days: data.days.present ? data.days.value : this.days,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlansData(')
          ..write('id: $id, ')
          ..write('sequence: $sequence, ')
          ..write('exercises: $exercises, ')
          ..write('days: $days, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sequence, exercises, days, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlansData &&
          other.id == this.id &&
          other.sequence == this.sequence &&
          other.exercises == this.exercises &&
          other.days == this.days &&
          other.title == this.title);
}

class PlansCompanion extends UpdateCompanion<PlansData> {
  final Value<int> id;
  final Value<int?> sequence;
  final Value<String> exercises;
  final Value<String> days;
  final Value<String?> title;
  const PlansCompanion({
    this.id = const Value.absent(),
    this.sequence = const Value.absent(),
    this.exercises = const Value.absent(),
    this.days = const Value.absent(),
    this.title = const Value.absent(),
  });
  PlansCompanion.insert({
    this.id = const Value.absent(),
    this.sequence = const Value.absent(),
    required String exercises,
    required String days,
    this.title = const Value.absent(),
  })  : exercises = Value(exercises),
        days = Value(days);
  static Insertable<PlansData> custom({
    Expression<int>? id,
    Expression<int>? sequence,
    Expression<String>? exercises,
    Expression<String>? days,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sequence != null) 'sequence': sequence,
      if (exercises != null) 'exercises': exercises,
      if (days != null) 'days': days,
      if (title != null) 'title': title,
    });
  }

  PlansCompanion copyWith(
      {Value<int>? id,
      Value<int?>? sequence,
      Value<String>? exercises,
      Value<String>? days,
      Value<String?>? title}) {
    return PlansCompanion(
      id: id ?? this.id,
      sequence: sequence ?? this.sequence,
      exercises: exercises ?? this.exercises,
      days: days ?? this.days,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sequence.present) {
      map['sequence'] = Variable<int>(sequence.value);
    }
    if (exercises.present) {
      map['exercises'] = Variable<String>(exercises.value);
    }
    if (days.present) {
      map['days'] = Variable<String>(days.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlansCompanion(')
          ..write('id: $id, ')
          ..write('sequence: $sequence, ')
          ..write('exercises: $exercises, ')
          ..write('days: $days, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class GymSets extends Table with TableInfo<GymSets, GymSetsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  GymSets(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<double> reps = GeneratedColumn<double>(
      'reps', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<bool> hidden = GeneratedColumn<bool>(
      'hidden', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("hidden" IN (0, 1))'),
      defaultValue: const Constant(false));
  late final GeneratedColumn<double> bodyWeight = GeneratedColumn<double>(
      'body_weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  late final GeneratedColumn<double> duration = GeneratedColumn<double>(
      'duration', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  late final GeneratedColumn<double> distance = GeneratedColumn<double>(
      'distance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  late final GeneratedColumn<bool> cardio = GeneratedColumn<bool>(
      'cardio', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("cardio" IN (0, 1))'),
      defaultValue: const Constant(false));
  late final GeneratedColumn<int> restMs = GeneratedColumn<int>(
      'rest_ms', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> maxSets = GeneratedColumn<int>(
      'max_sets', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> incline = GeneratedColumn<int>(
      'incline', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        reps,
        weight,
        unit,
        created,
        hidden,
        bodyWeight,
        duration,
        distance,
        cardio,
        restMs,
        maxSets,
        incline
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gym_sets';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GymSetsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GymSetsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}reps'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      hidden: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hidden'])!,
      bodyWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}body_weight'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}duration'])!,
      distance: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}distance'])!,
      cardio: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}cardio'])!,
      restMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rest_ms']),
      maxSets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_sets']),
      incline: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}incline']),
    );
  }

  @override
  GymSets createAlias(String alias) {
    return GymSets(attachedDatabase, alias);
  }
}

class GymSetsData extends DataClass implements Insertable<GymSetsData> {
  final int id;
  final String name;
  final double reps;
  final double weight;
  final String unit;
  final DateTime created;
  final bool hidden;
  final double bodyWeight;
  final double duration;
  final double distance;
  final bool cardio;
  final int? restMs;
  final int? maxSets;
  final int? incline;
  const GymSetsData(
      {required this.id,
      required this.name,
      required this.reps,
      required this.weight,
      required this.unit,
      required this.created,
      required this.hidden,
      required this.bodyWeight,
      required this.duration,
      required this.distance,
      required this.cardio,
      this.restMs,
      this.maxSets,
      this.incline});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['reps'] = Variable<double>(reps);
    map['weight'] = Variable<double>(weight);
    map['unit'] = Variable<String>(unit);
    map['created'] = Variable<DateTime>(created);
    map['hidden'] = Variable<bool>(hidden);
    map['body_weight'] = Variable<double>(bodyWeight);
    map['duration'] = Variable<double>(duration);
    map['distance'] = Variable<double>(distance);
    map['cardio'] = Variable<bool>(cardio);
    if (!nullToAbsent || restMs != null) {
      map['rest_ms'] = Variable<int>(restMs);
    }
    if (!nullToAbsent || maxSets != null) {
      map['max_sets'] = Variable<int>(maxSets);
    }
    if (!nullToAbsent || incline != null) {
      map['incline'] = Variable<int>(incline);
    }
    return map;
  }

  GymSetsCompanion toCompanion(bool nullToAbsent) {
    return GymSetsCompanion(
      id: Value(id),
      name: Value(name),
      reps: Value(reps),
      weight: Value(weight),
      unit: Value(unit),
      created: Value(created),
      hidden: Value(hidden),
      bodyWeight: Value(bodyWeight),
      duration: Value(duration),
      distance: Value(distance),
      cardio: Value(cardio),
      restMs:
          restMs == null && nullToAbsent ? const Value.absent() : Value(restMs),
      maxSets: maxSets == null && nullToAbsent
          ? const Value.absent()
          : Value(maxSets),
      incline: incline == null && nullToAbsent
          ? const Value.absent()
          : Value(incline),
    );
  }

  factory GymSetsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GymSetsData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      reps: serializer.fromJson<double>(json['reps']),
      weight: serializer.fromJson<double>(json['weight']),
      unit: serializer.fromJson<String>(json['unit']),
      created: serializer.fromJson<DateTime>(json['created']),
      hidden: serializer.fromJson<bool>(json['hidden']),
      bodyWeight: serializer.fromJson<double>(json['bodyWeight']),
      duration: serializer.fromJson<double>(json['duration']),
      distance: serializer.fromJson<double>(json['distance']),
      cardio: serializer.fromJson<bool>(json['cardio']),
      restMs: serializer.fromJson<int?>(json['restMs']),
      maxSets: serializer.fromJson<int?>(json['maxSets']),
      incline: serializer.fromJson<int?>(json['incline']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'reps': serializer.toJson<double>(reps),
      'weight': serializer.toJson<double>(weight),
      'unit': serializer.toJson<String>(unit),
      'created': serializer.toJson<DateTime>(created),
      'hidden': serializer.toJson<bool>(hidden),
      'bodyWeight': serializer.toJson<double>(bodyWeight),
      'duration': serializer.toJson<double>(duration),
      'distance': serializer.toJson<double>(distance),
      'cardio': serializer.toJson<bool>(cardio),
      'restMs': serializer.toJson<int?>(restMs),
      'maxSets': serializer.toJson<int?>(maxSets),
      'incline': serializer.toJson<int?>(incline),
    };
  }

  GymSetsData copyWith(
          {int? id,
          String? name,
          double? reps,
          double? weight,
          String? unit,
          DateTime? created,
          bool? hidden,
          double? bodyWeight,
          double? duration,
          double? distance,
          bool? cardio,
          Value<int?> restMs = const Value.absent(),
          Value<int?> maxSets = const Value.absent(),
          Value<int?> incline = const Value.absent()}) =>
      GymSetsData(
        id: id ?? this.id,
        name: name ?? this.name,
        reps: reps ?? this.reps,
        weight: weight ?? this.weight,
        unit: unit ?? this.unit,
        created: created ?? this.created,
        hidden: hidden ?? this.hidden,
        bodyWeight: bodyWeight ?? this.bodyWeight,
        duration: duration ?? this.duration,
        distance: distance ?? this.distance,
        cardio: cardio ?? this.cardio,
        restMs: restMs.present ? restMs.value : this.restMs,
        maxSets: maxSets.present ? maxSets.value : this.maxSets,
        incline: incline.present ? incline.value : this.incline,
      );
  GymSetsData copyWithCompanion(GymSetsCompanion data) {
    return GymSetsData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      reps: data.reps.present ? data.reps.value : this.reps,
      weight: data.weight.present ? data.weight.value : this.weight,
      unit: data.unit.present ? data.unit.value : this.unit,
      created: data.created.present ? data.created.value : this.created,
      hidden: data.hidden.present ? data.hidden.value : this.hidden,
      bodyWeight:
          data.bodyWeight.present ? data.bodyWeight.value : this.bodyWeight,
      duration: data.duration.present ? data.duration.value : this.duration,
      distance: data.distance.present ? data.distance.value : this.distance,
      cardio: data.cardio.present ? data.cardio.value : this.cardio,
      restMs: data.restMs.present ? data.restMs.value : this.restMs,
      maxSets: data.maxSets.present ? data.maxSets.value : this.maxSets,
      incline: data.incline.present ? data.incline.value : this.incline,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GymSetsData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('unit: $unit, ')
          ..write('created: $created, ')
          ..write('hidden: $hidden, ')
          ..write('bodyWeight: $bodyWeight, ')
          ..write('duration: $duration, ')
          ..write('distance: $distance, ')
          ..write('cardio: $cardio, ')
          ..write('restMs: $restMs, ')
          ..write('maxSets: $maxSets, ')
          ..write('incline: $incline')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, reps, weight, unit, created, hidden,
      bodyWeight, duration, distance, cardio, restMs, maxSets, incline);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GymSetsData &&
          other.id == this.id &&
          other.name == this.name &&
          other.reps == this.reps &&
          other.weight == this.weight &&
          other.unit == this.unit &&
          other.created == this.created &&
          other.hidden == this.hidden &&
          other.bodyWeight == this.bodyWeight &&
          other.duration == this.duration &&
          other.distance == this.distance &&
          other.cardio == this.cardio &&
          other.restMs == this.restMs &&
          other.maxSets == this.maxSets &&
          other.incline == this.incline);
}

class GymSetsCompanion extends UpdateCompanion<GymSetsData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> reps;
  final Value<double> weight;
  final Value<String> unit;
  final Value<DateTime> created;
  final Value<bool> hidden;
  final Value<double> bodyWeight;
  final Value<double> duration;
  final Value<double> distance;
  final Value<bool> cardio;
  final Value<int?> restMs;
  final Value<int?> maxSets;
  final Value<int?> incline;
  const GymSetsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.unit = const Value.absent(),
    this.created = const Value.absent(),
    this.hidden = const Value.absent(),
    this.bodyWeight = const Value.absent(),
    this.duration = const Value.absent(),
    this.distance = const Value.absent(),
    this.cardio = const Value.absent(),
    this.restMs = const Value.absent(),
    this.maxSets = const Value.absent(),
    this.incline = const Value.absent(),
  });
  GymSetsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double reps,
    required double weight,
    required String unit,
    required DateTime created,
    this.hidden = const Value.absent(),
    this.bodyWeight = const Value.absent(),
    this.duration = const Value.absent(),
    this.distance = const Value.absent(),
    this.cardio = const Value.absent(),
    this.restMs = const Value.absent(),
    this.maxSets = const Value.absent(),
    this.incline = const Value.absent(),
  })  : name = Value(name),
        reps = Value(reps),
        weight = Value(weight),
        unit = Value(unit),
        created = Value(created);
  static Insertable<GymSetsData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? reps,
    Expression<double>? weight,
    Expression<String>? unit,
    Expression<DateTime>? created,
    Expression<bool>? hidden,
    Expression<double>? bodyWeight,
    Expression<double>? duration,
    Expression<double>? distance,
    Expression<bool>? cardio,
    Expression<int>? restMs,
    Expression<int>? maxSets,
    Expression<int>? incline,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (reps != null) 'reps': reps,
      if (weight != null) 'weight': weight,
      if (unit != null) 'unit': unit,
      if (created != null) 'created': created,
      if (hidden != null) 'hidden': hidden,
      if (bodyWeight != null) 'body_weight': bodyWeight,
      if (duration != null) 'duration': duration,
      if (distance != null) 'distance': distance,
      if (cardio != null) 'cardio': cardio,
      if (restMs != null) 'rest_ms': restMs,
      if (maxSets != null) 'max_sets': maxSets,
      if (incline != null) 'incline': incline,
    });
  }

  GymSetsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? reps,
      Value<double>? weight,
      Value<String>? unit,
      Value<DateTime>? created,
      Value<bool>? hidden,
      Value<double>? bodyWeight,
      Value<double>? duration,
      Value<double>? distance,
      Value<bool>? cardio,
      Value<int?>? restMs,
      Value<int?>? maxSets,
      Value<int?>? incline}) {
    return GymSetsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      unit: unit ?? this.unit,
      created: created ?? this.created,
      hidden: hidden ?? this.hidden,
      bodyWeight: bodyWeight ?? this.bodyWeight,
      duration: duration ?? this.duration,
      distance: distance ?? this.distance,
      cardio: cardio ?? this.cardio,
      restMs: restMs ?? this.restMs,
      maxSets: maxSets ?? this.maxSets,
      incline: incline ?? this.incline,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (reps.present) {
      map['reps'] = Variable<double>(reps.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (hidden.present) {
      map['hidden'] = Variable<bool>(hidden.value);
    }
    if (bodyWeight.present) {
      map['body_weight'] = Variable<double>(bodyWeight.value);
    }
    if (duration.present) {
      map['duration'] = Variable<double>(duration.value);
    }
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    if (cardio.present) {
      map['cardio'] = Variable<bool>(cardio.value);
    }
    if (restMs.present) {
      map['rest_ms'] = Variable<int>(restMs.value);
    }
    if (maxSets.present) {
      map['max_sets'] = Variable<int>(maxSets.value);
    }
    if (incline.present) {
      map['incline'] = Variable<int>(incline.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GymSetsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('unit: $unit, ')
          ..write('created: $created, ')
          ..write('hidden: $hidden, ')
          ..write('bodyWeight: $bodyWeight, ')
          ..write('duration: $duration, ')
          ..write('distance: $distance, ')
          ..write('cardio: $cardio, ')
          ..write('restMs: $restMs, ')
          ..write('maxSets: $maxSets, ')
          ..write('incline: $incline')
          ..write(')'))
        .toString();
  }
}

class Settings extends Table with TableInfo<Settings, SettingsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Settings(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
      'theme_mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> planTrailing = GeneratedColumn<String>(
      'plan_trailing', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> longDateFormat = GeneratedColumn<String>(
      'long_date_format', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> shortDateFormat = GeneratedColumn<String>(
      'short_date_format', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> timerDuration = GeneratedColumn<int>(
      'timer_duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> maxSets = GeneratedColumn<int>(
      'max_sets', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<bool> vibrate = GeneratedColumn<bool>(
      'vibrate', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("vibrate" IN (0, 1))'));
  late final GeneratedColumn<bool> restTimers = GeneratedColumn<bool>(
      'rest_timers', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("rest_timers" IN (0, 1))'));
  late final GeneratedColumn<bool> showUnits = GeneratedColumn<bool>(
      'show_units', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("show_units" IN (0, 1))'));
  late final GeneratedColumn<bool> systemColors = GeneratedColumn<bool>(
      'system_colors', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("system_colors" IN (0, 1))'));
  late final GeneratedColumn<bool> explainedPermissions = GeneratedColumn<bool>(
      'explained_permissions', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("explained_permissions" IN (0, 1))'));
  late final GeneratedColumn<bool> hideTimerTab = GeneratedColumn<bool>(
      'hide_timer_tab', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("hide_timer_tab" IN (0, 1))'));
  late final GeneratedColumn<bool> hideHistoryTab = GeneratedColumn<bool>(
      'hide_history_tab', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("hide_history_tab" IN (0, 1))'));
  late final GeneratedColumn<bool> curveLines = GeneratedColumn<bool>(
      'curve_lines', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("curve_lines" IN (0, 1))'));
  late final GeneratedColumn<bool> hideWeight = GeneratedColumn<bool>(
      'hide_weight', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("hide_weight" IN (0, 1))'));
  late final GeneratedColumn<bool> groupHistory = GeneratedColumn<bool>(
      'group_history', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("group_history" IN (0, 1))'));
  late final GeneratedColumn<String> alarmSound = GeneratedColumn<String>(
      'alarm_sound', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> cardioUnit = GeneratedColumn<String>(
      'cardio_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> strengthUnit = GeneratedColumn<String>(
      'strength_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        themeMode,
        planTrailing,
        longDateFormat,
        shortDateFormat,
        timerDuration,
        maxSets,
        vibrate,
        restTimers,
        showUnits,
        systemColors,
        explainedPermissions,
        hideTimerTab,
        hideHistoryTab,
        curveLines,
        hideWeight,
        groupHistory,
        alarmSound,
        cardioUnit,
        strengthUnit
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      themeMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme_mode'])!,
      planTrailing: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_trailing'])!,
      longDateFormat: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}long_date_format'])!,
      shortDateFormat: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}short_date_format'])!,
      timerDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timer_duration'])!,
      maxSets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_sets'])!,
      vibrate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}vibrate'])!,
      restTimers: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}rest_timers'])!,
      showUnits: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}show_units'])!,
      systemColors: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}system_colors'])!,
      explainedPermissions: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}explained_permissions'])!,
      hideTimerTab: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hide_timer_tab'])!,
      hideHistoryTab: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hide_history_tab'])!,
      curveLines: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}curve_lines'])!,
      hideWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hide_weight'])!,
      groupHistory: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}group_history'])!,
      alarmSound: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alarm_sound'])!,
      cardioUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cardio_unit'])!,
      strengthUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}strength_unit'])!,
    );
  }

  @override
  Settings createAlias(String alias) {
    return Settings(attachedDatabase, alias);
  }
}

class SettingsData extends DataClass implements Insertable<SettingsData> {
  final int id;
  final String themeMode;
  final String planTrailing;
  final String longDateFormat;
  final String shortDateFormat;
  final int timerDuration;
  final int maxSets;
  final bool vibrate;
  final bool restTimers;
  final bool showUnits;
  final bool systemColors;
  final bool explainedPermissions;
  final bool hideTimerTab;
  final bool hideHistoryTab;
  final bool curveLines;
  final bool hideWeight;
  final bool groupHistory;
  final String alarmSound;
  final String cardioUnit;
  final String strengthUnit;
  const SettingsData(
      {required this.id,
      required this.themeMode,
      required this.planTrailing,
      required this.longDateFormat,
      required this.shortDateFormat,
      required this.timerDuration,
      required this.maxSets,
      required this.vibrate,
      required this.restTimers,
      required this.showUnits,
      required this.systemColors,
      required this.explainedPermissions,
      required this.hideTimerTab,
      required this.hideHistoryTab,
      required this.curveLines,
      required this.hideWeight,
      required this.groupHistory,
      required this.alarmSound,
      required this.cardioUnit,
      required this.strengthUnit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['theme_mode'] = Variable<String>(themeMode);
    map['plan_trailing'] = Variable<String>(planTrailing);
    map['long_date_format'] = Variable<String>(longDateFormat);
    map['short_date_format'] = Variable<String>(shortDateFormat);
    map['timer_duration'] = Variable<int>(timerDuration);
    map['max_sets'] = Variable<int>(maxSets);
    map['vibrate'] = Variable<bool>(vibrate);
    map['rest_timers'] = Variable<bool>(restTimers);
    map['show_units'] = Variable<bool>(showUnits);
    map['system_colors'] = Variable<bool>(systemColors);
    map['explained_permissions'] = Variable<bool>(explainedPermissions);
    map['hide_timer_tab'] = Variable<bool>(hideTimerTab);
    map['hide_history_tab'] = Variable<bool>(hideHistoryTab);
    map['curve_lines'] = Variable<bool>(curveLines);
    map['hide_weight'] = Variable<bool>(hideWeight);
    map['group_history'] = Variable<bool>(groupHistory);
    map['alarm_sound'] = Variable<String>(alarmSound);
    map['cardio_unit'] = Variable<String>(cardioUnit);
    map['strength_unit'] = Variable<String>(strengthUnit);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      themeMode: Value(themeMode),
      planTrailing: Value(planTrailing),
      longDateFormat: Value(longDateFormat),
      shortDateFormat: Value(shortDateFormat),
      timerDuration: Value(timerDuration),
      maxSets: Value(maxSets),
      vibrate: Value(vibrate),
      restTimers: Value(restTimers),
      showUnits: Value(showUnits),
      systemColors: Value(systemColors),
      explainedPermissions: Value(explainedPermissions),
      hideTimerTab: Value(hideTimerTab),
      hideHistoryTab: Value(hideHistoryTab),
      curveLines: Value(curveLines),
      hideWeight: Value(hideWeight),
      groupHistory: Value(groupHistory),
      alarmSound: Value(alarmSound),
      cardioUnit: Value(cardioUnit),
      strengthUnit: Value(strengthUnit),
    );
  }

  factory SettingsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsData(
      id: serializer.fromJson<int>(json['id']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      planTrailing: serializer.fromJson<String>(json['planTrailing']),
      longDateFormat: serializer.fromJson<String>(json['longDateFormat']),
      shortDateFormat: serializer.fromJson<String>(json['shortDateFormat']),
      timerDuration: serializer.fromJson<int>(json['timerDuration']),
      maxSets: serializer.fromJson<int>(json['maxSets']),
      vibrate: serializer.fromJson<bool>(json['vibrate']),
      restTimers: serializer.fromJson<bool>(json['restTimers']),
      showUnits: serializer.fromJson<bool>(json['showUnits']),
      systemColors: serializer.fromJson<bool>(json['systemColors']),
      explainedPermissions:
          serializer.fromJson<bool>(json['explainedPermissions']),
      hideTimerTab: serializer.fromJson<bool>(json['hideTimerTab']),
      hideHistoryTab: serializer.fromJson<bool>(json['hideHistoryTab']),
      curveLines: serializer.fromJson<bool>(json['curveLines']),
      hideWeight: serializer.fromJson<bool>(json['hideWeight']),
      groupHistory: serializer.fromJson<bool>(json['groupHistory']),
      alarmSound: serializer.fromJson<String>(json['alarmSound']),
      cardioUnit: serializer.fromJson<String>(json['cardioUnit']),
      strengthUnit: serializer.fromJson<String>(json['strengthUnit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'themeMode': serializer.toJson<String>(themeMode),
      'planTrailing': serializer.toJson<String>(planTrailing),
      'longDateFormat': serializer.toJson<String>(longDateFormat),
      'shortDateFormat': serializer.toJson<String>(shortDateFormat),
      'timerDuration': serializer.toJson<int>(timerDuration),
      'maxSets': serializer.toJson<int>(maxSets),
      'vibrate': serializer.toJson<bool>(vibrate),
      'restTimers': serializer.toJson<bool>(restTimers),
      'showUnits': serializer.toJson<bool>(showUnits),
      'systemColors': serializer.toJson<bool>(systemColors),
      'explainedPermissions': serializer.toJson<bool>(explainedPermissions),
      'hideTimerTab': serializer.toJson<bool>(hideTimerTab),
      'hideHistoryTab': serializer.toJson<bool>(hideHistoryTab),
      'curveLines': serializer.toJson<bool>(curveLines),
      'hideWeight': serializer.toJson<bool>(hideWeight),
      'groupHistory': serializer.toJson<bool>(groupHistory),
      'alarmSound': serializer.toJson<String>(alarmSound),
      'cardioUnit': serializer.toJson<String>(cardioUnit),
      'strengthUnit': serializer.toJson<String>(strengthUnit),
    };
  }

  SettingsData copyWith(
          {int? id,
          String? themeMode,
          String? planTrailing,
          String? longDateFormat,
          String? shortDateFormat,
          int? timerDuration,
          int? maxSets,
          bool? vibrate,
          bool? restTimers,
          bool? showUnits,
          bool? systemColors,
          bool? explainedPermissions,
          bool? hideTimerTab,
          bool? hideHistoryTab,
          bool? curveLines,
          bool? hideWeight,
          bool? groupHistory,
          String? alarmSound,
          String? cardioUnit,
          String? strengthUnit}) =>
      SettingsData(
        id: id ?? this.id,
        themeMode: themeMode ?? this.themeMode,
        planTrailing: planTrailing ?? this.planTrailing,
        longDateFormat: longDateFormat ?? this.longDateFormat,
        shortDateFormat: shortDateFormat ?? this.shortDateFormat,
        timerDuration: timerDuration ?? this.timerDuration,
        maxSets: maxSets ?? this.maxSets,
        vibrate: vibrate ?? this.vibrate,
        restTimers: restTimers ?? this.restTimers,
        showUnits: showUnits ?? this.showUnits,
        systemColors: systemColors ?? this.systemColors,
        explainedPermissions: explainedPermissions ?? this.explainedPermissions,
        hideTimerTab: hideTimerTab ?? this.hideTimerTab,
        hideHistoryTab: hideHistoryTab ?? this.hideHistoryTab,
        curveLines: curveLines ?? this.curveLines,
        hideWeight: hideWeight ?? this.hideWeight,
        groupHistory: groupHistory ?? this.groupHistory,
        alarmSound: alarmSound ?? this.alarmSound,
        cardioUnit: cardioUnit ?? this.cardioUnit,
        strengthUnit: strengthUnit ?? this.strengthUnit,
      );
  SettingsData copyWithCompanion(SettingsCompanion data) {
    return SettingsData(
      id: data.id.present ? data.id.value : this.id,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      planTrailing: data.planTrailing.present
          ? data.planTrailing.value
          : this.planTrailing,
      longDateFormat: data.longDateFormat.present
          ? data.longDateFormat.value
          : this.longDateFormat,
      shortDateFormat: data.shortDateFormat.present
          ? data.shortDateFormat.value
          : this.shortDateFormat,
      timerDuration: data.timerDuration.present
          ? data.timerDuration.value
          : this.timerDuration,
      maxSets: data.maxSets.present ? data.maxSets.value : this.maxSets,
      vibrate: data.vibrate.present ? data.vibrate.value : this.vibrate,
      restTimers:
          data.restTimers.present ? data.restTimers.value : this.restTimers,
      showUnits: data.showUnits.present ? data.showUnits.value : this.showUnits,
      systemColors: data.systemColors.present
          ? data.systemColors.value
          : this.systemColors,
      explainedPermissions: data.explainedPermissions.present
          ? data.explainedPermissions.value
          : this.explainedPermissions,
      hideTimerTab: data.hideTimerTab.present
          ? data.hideTimerTab.value
          : this.hideTimerTab,
      hideHistoryTab: data.hideHistoryTab.present
          ? data.hideHistoryTab.value
          : this.hideHistoryTab,
      curveLines:
          data.curveLines.present ? data.curveLines.value : this.curveLines,
      hideWeight:
          data.hideWeight.present ? data.hideWeight.value : this.hideWeight,
      groupHistory: data.groupHistory.present
          ? data.groupHistory.value
          : this.groupHistory,
      alarmSound:
          data.alarmSound.present ? data.alarmSound.value : this.alarmSound,
      cardioUnit:
          data.cardioUnit.present ? data.cardioUnit.value : this.cardioUnit,
      strengthUnit: data.strengthUnit.present
          ? data.strengthUnit.value
          : this.strengthUnit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsData(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('planTrailing: $planTrailing, ')
          ..write('longDateFormat: $longDateFormat, ')
          ..write('shortDateFormat: $shortDateFormat, ')
          ..write('timerDuration: $timerDuration, ')
          ..write('maxSets: $maxSets, ')
          ..write('vibrate: $vibrate, ')
          ..write('restTimers: $restTimers, ')
          ..write('showUnits: $showUnits, ')
          ..write('systemColors: $systemColors, ')
          ..write('explainedPermissions: $explainedPermissions, ')
          ..write('hideTimerTab: $hideTimerTab, ')
          ..write('hideHistoryTab: $hideHistoryTab, ')
          ..write('curveLines: $curveLines, ')
          ..write('hideWeight: $hideWeight, ')
          ..write('groupHistory: $groupHistory, ')
          ..write('alarmSound: $alarmSound, ')
          ..write('cardioUnit: $cardioUnit, ')
          ..write('strengthUnit: $strengthUnit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      themeMode,
      planTrailing,
      longDateFormat,
      shortDateFormat,
      timerDuration,
      maxSets,
      vibrate,
      restTimers,
      showUnits,
      systemColors,
      explainedPermissions,
      hideTimerTab,
      hideHistoryTab,
      curveLines,
      hideWeight,
      groupHistory,
      alarmSound,
      cardioUnit,
      strengthUnit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsData &&
          other.id == this.id &&
          other.themeMode == this.themeMode &&
          other.planTrailing == this.planTrailing &&
          other.longDateFormat == this.longDateFormat &&
          other.shortDateFormat == this.shortDateFormat &&
          other.timerDuration == this.timerDuration &&
          other.maxSets == this.maxSets &&
          other.vibrate == this.vibrate &&
          other.restTimers == this.restTimers &&
          other.showUnits == this.showUnits &&
          other.systemColors == this.systemColors &&
          other.explainedPermissions == this.explainedPermissions &&
          other.hideTimerTab == this.hideTimerTab &&
          other.hideHistoryTab == this.hideHistoryTab &&
          other.curveLines == this.curveLines &&
          other.hideWeight == this.hideWeight &&
          other.groupHistory == this.groupHistory &&
          other.alarmSound == this.alarmSound &&
          other.cardioUnit == this.cardioUnit &&
          other.strengthUnit == this.strengthUnit);
}

class SettingsCompanion extends UpdateCompanion<SettingsData> {
  final Value<int> id;
  final Value<String> themeMode;
  final Value<String> planTrailing;
  final Value<String> longDateFormat;
  final Value<String> shortDateFormat;
  final Value<int> timerDuration;
  final Value<int> maxSets;
  final Value<bool> vibrate;
  final Value<bool> restTimers;
  final Value<bool> showUnits;
  final Value<bool> systemColors;
  final Value<bool> explainedPermissions;
  final Value<bool> hideTimerTab;
  final Value<bool> hideHistoryTab;
  final Value<bool> curveLines;
  final Value<bool> hideWeight;
  final Value<bool> groupHistory;
  final Value<String> alarmSound;
  final Value<String> cardioUnit;
  final Value<String> strengthUnit;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.planTrailing = const Value.absent(),
    this.longDateFormat = const Value.absent(),
    this.shortDateFormat = const Value.absent(),
    this.timerDuration = const Value.absent(),
    this.maxSets = const Value.absent(),
    this.vibrate = const Value.absent(),
    this.restTimers = const Value.absent(),
    this.showUnits = const Value.absent(),
    this.systemColors = const Value.absent(),
    this.explainedPermissions = const Value.absent(),
    this.hideTimerTab = const Value.absent(),
    this.hideHistoryTab = const Value.absent(),
    this.curveLines = const Value.absent(),
    this.hideWeight = const Value.absent(),
    this.groupHistory = const Value.absent(),
    this.alarmSound = const Value.absent(),
    this.cardioUnit = const Value.absent(),
    this.strengthUnit = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    required String themeMode,
    required String planTrailing,
    required String longDateFormat,
    required String shortDateFormat,
    required int timerDuration,
    required int maxSets,
    required bool vibrate,
    required bool restTimers,
    required bool showUnits,
    required bool systemColors,
    required bool explainedPermissions,
    required bool hideTimerTab,
    required bool hideHistoryTab,
    required bool curveLines,
    required bool hideWeight,
    required bool groupHistory,
    required String alarmSound,
    required String cardioUnit,
    required String strengthUnit,
  })  : themeMode = Value(themeMode),
        planTrailing = Value(planTrailing),
        longDateFormat = Value(longDateFormat),
        shortDateFormat = Value(shortDateFormat),
        timerDuration = Value(timerDuration),
        maxSets = Value(maxSets),
        vibrate = Value(vibrate),
        restTimers = Value(restTimers),
        showUnits = Value(showUnits),
        systemColors = Value(systemColors),
        explainedPermissions = Value(explainedPermissions),
        hideTimerTab = Value(hideTimerTab),
        hideHistoryTab = Value(hideHistoryTab),
        curveLines = Value(curveLines),
        hideWeight = Value(hideWeight),
        groupHistory = Value(groupHistory),
        alarmSound = Value(alarmSound),
        cardioUnit = Value(cardioUnit),
        strengthUnit = Value(strengthUnit);
  static Insertable<SettingsData> custom({
    Expression<int>? id,
    Expression<String>? themeMode,
    Expression<String>? planTrailing,
    Expression<String>? longDateFormat,
    Expression<String>? shortDateFormat,
    Expression<int>? timerDuration,
    Expression<int>? maxSets,
    Expression<bool>? vibrate,
    Expression<bool>? restTimers,
    Expression<bool>? showUnits,
    Expression<bool>? systemColors,
    Expression<bool>? explainedPermissions,
    Expression<bool>? hideTimerTab,
    Expression<bool>? hideHistoryTab,
    Expression<bool>? curveLines,
    Expression<bool>? hideWeight,
    Expression<bool>? groupHistory,
    Expression<String>? alarmSound,
    Expression<String>? cardioUnit,
    Expression<String>? strengthUnit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (themeMode != null) 'theme_mode': themeMode,
      if (planTrailing != null) 'plan_trailing': planTrailing,
      if (longDateFormat != null) 'long_date_format': longDateFormat,
      if (shortDateFormat != null) 'short_date_format': shortDateFormat,
      if (timerDuration != null) 'timer_duration': timerDuration,
      if (maxSets != null) 'max_sets': maxSets,
      if (vibrate != null) 'vibrate': vibrate,
      if (restTimers != null) 'rest_timers': restTimers,
      if (showUnits != null) 'show_units': showUnits,
      if (systemColors != null) 'system_colors': systemColors,
      if (explainedPermissions != null)
        'explained_permissions': explainedPermissions,
      if (hideTimerTab != null) 'hide_timer_tab': hideTimerTab,
      if (hideHistoryTab != null) 'hide_history_tab': hideHistoryTab,
      if (curveLines != null) 'curve_lines': curveLines,
      if (hideWeight != null) 'hide_weight': hideWeight,
      if (groupHistory != null) 'group_history': groupHistory,
      if (alarmSound != null) 'alarm_sound': alarmSound,
      if (cardioUnit != null) 'cardio_unit': cardioUnit,
      if (strengthUnit != null) 'strength_unit': strengthUnit,
    });
  }

  SettingsCompanion copyWith(
      {Value<int>? id,
      Value<String>? themeMode,
      Value<String>? planTrailing,
      Value<String>? longDateFormat,
      Value<String>? shortDateFormat,
      Value<int>? timerDuration,
      Value<int>? maxSets,
      Value<bool>? vibrate,
      Value<bool>? restTimers,
      Value<bool>? showUnits,
      Value<bool>? systemColors,
      Value<bool>? explainedPermissions,
      Value<bool>? hideTimerTab,
      Value<bool>? hideHistoryTab,
      Value<bool>? curveLines,
      Value<bool>? hideWeight,
      Value<bool>? groupHistory,
      Value<String>? alarmSound,
      Value<String>? cardioUnit,
      Value<String>? strengthUnit}) {
    return SettingsCompanion(
      id: id ?? this.id,
      themeMode: themeMode ?? this.themeMode,
      planTrailing: planTrailing ?? this.planTrailing,
      longDateFormat: longDateFormat ?? this.longDateFormat,
      shortDateFormat: shortDateFormat ?? this.shortDateFormat,
      timerDuration: timerDuration ?? this.timerDuration,
      maxSets: maxSets ?? this.maxSets,
      vibrate: vibrate ?? this.vibrate,
      restTimers: restTimers ?? this.restTimers,
      showUnits: showUnits ?? this.showUnits,
      systemColors: systemColors ?? this.systemColors,
      explainedPermissions: explainedPermissions ?? this.explainedPermissions,
      hideTimerTab: hideTimerTab ?? this.hideTimerTab,
      hideHistoryTab: hideHistoryTab ?? this.hideHistoryTab,
      curveLines: curveLines ?? this.curveLines,
      hideWeight: hideWeight ?? this.hideWeight,
      groupHistory: groupHistory ?? this.groupHistory,
      alarmSound: alarmSound ?? this.alarmSound,
      cardioUnit: cardioUnit ?? this.cardioUnit,
      strengthUnit: strengthUnit ?? this.strengthUnit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (planTrailing.present) {
      map['plan_trailing'] = Variable<String>(planTrailing.value);
    }
    if (longDateFormat.present) {
      map['long_date_format'] = Variable<String>(longDateFormat.value);
    }
    if (shortDateFormat.present) {
      map['short_date_format'] = Variable<String>(shortDateFormat.value);
    }
    if (timerDuration.present) {
      map['timer_duration'] = Variable<int>(timerDuration.value);
    }
    if (maxSets.present) {
      map['max_sets'] = Variable<int>(maxSets.value);
    }
    if (vibrate.present) {
      map['vibrate'] = Variable<bool>(vibrate.value);
    }
    if (restTimers.present) {
      map['rest_timers'] = Variable<bool>(restTimers.value);
    }
    if (showUnits.present) {
      map['show_units'] = Variable<bool>(showUnits.value);
    }
    if (systemColors.present) {
      map['system_colors'] = Variable<bool>(systemColors.value);
    }
    if (explainedPermissions.present) {
      map['explained_permissions'] = Variable<bool>(explainedPermissions.value);
    }
    if (hideTimerTab.present) {
      map['hide_timer_tab'] = Variable<bool>(hideTimerTab.value);
    }
    if (hideHistoryTab.present) {
      map['hide_history_tab'] = Variable<bool>(hideHistoryTab.value);
    }
    if (curveLines.present) {
      map['curve_lines'] = Variable<bool>(curveLines.value);
    }
    if (hideWeight.present) {
      map['hide_weight'] = Variable<bool>(hideWeight.value);
    }
    if (groupHistory.present) {
      map['group_history'] = Variable<bool>(groupHistory.value);
    }
    if (alarmSound.present) {
      map['alarm_sound'] = Variable<String>(alarmSound.value);
    }
    if (cardioUnit.present) {
      map['cardio_unit'] = Variable<String>(cardioUnit.value);
    }
    if (strengthUnit.present) {
      map['strength_unit'] = Variable<String>(strengthUnit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('planTrailing: $planTrailing, ')
          ..write('longDateFormat: $longDateFormat, ')
          ..write('shortDateFormat: $shortDateFormat, ')
          ..write('timerDuration: $timerDuration, ')
          ..write('maxSets: $maxSets, ')
          ..write('vibrate: $vibrate, ')
          ..write('restTimers: $restTimers, ')
          ..write('showUnits: $showUnits, ')
          ..write('systemColors: $systemColors, ')
          ..write('explainedPermissions: $explainedPermissions, ')
          ..write('hideTimerTab: $hideTimerTab, ')
          ..write('hideHistoryTab: $hideHistoryTab, ')
          ..write('curveLines: $curveLines, ')
          ..write('hideWeight: $hideWeight, ')
          ..write('groupHistory: $groupHistory, ')
          ..write('alarmSound: $alarmSound, ')
          ..write('cardioUnit: $cardioUnit, ')
          ..write('strengthUnit: $strengthUnit')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV16 extends GeneratedDatabase {
  DatabaseAtV16(QueryExecutor e) : super(e);
  late final Plans plans = Plans(this);
  late final GymSets gymSets = GymSets(this);
  late final Settings settings = Settings(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [plans, gymSets, settings];
  @override
  int get schemaVersion => 16;
}
