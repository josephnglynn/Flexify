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
  late final GeneratedColumn<String> exercises = GeneratedColumn<String>(
      'exercises', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> days = GeneratedColumn<String>(
      'days', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, exercises, days];
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
      exercises: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercises'])!,
      days: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}days'])!,
    );
  }

  @override
  Plans createAlias(String alias) {
    return Plans(attachedDatabase, alias);
  }
}

class PlansData extends DataClass implements Insertable<PlansData> {
  final int id;
  final String exercises;
  final String days;
  const PlansData(
      {required this.id, required this.exercises, required this.days});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['exercises'] = Variable<String>(exercises);
    map['days'] = Variable<String>(days);
    return map;
  }

  PlansCompanion toCompanion(bool nullToAbsent) {
    return PlansCompanion(
      id: Value(id),
      exercises: Value(exercises),
      days: Value(days),
    );
  }

  factory PlansData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlansData(
      id: serializer.fromJson<int>(json['id']),
      exercises: serializer.fromJson<String>(json['exercises']),
      days: serializer.fromJson<String>(json['days']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'exercises': serializer.toJson<String>(exercises),
      'days': serializer.toJson<String>(days),
    };
  }

  PlansData copyWith({int? id, String? exercises, String? days}) => PlansData(
        id: id ?? this.id,
        exercises: exercises ?? this.exercises,
        days: days ?? this.days,
      );
  PlansData copyWithCompanion(PlansCompanion data) {
    return PlansData(
      id: data.id.present ? data.id.value : this.id,
      exercises: data.exercises.present ? data.exercises.value : this.exercises,
      days: data.days.present ? data.days.value : this.days,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlansData(')
          ..write('id: $id, ')
          ..write('exercises: $exercises, ')
          ..write('days: $days')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, exercises, days);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlansData &&
          other.id == this.id &&
          other.exercises == this.exercises &&
          other.days == this.days);
}

class PlansCompanion extends UpdateCompanion<PlansData> {
  final Value<int> id;
  final Value<String> exercises;
  final Value<String> days;
  const PlansCompanion({
    this.id = const Value.absent(),
    this.exercises = const Value.absent(),
    this.days = const Value.absent(),
  });
  PlansCompanion.insert({
    this.id = const Value.absent(),
    required String exercises,
    required String days,
  })  : exercises = Value(exercises),
        days = Value(days);
  static Insertable<PlansData> custom({
    Expression<int>? id,
    Expression<String>? exercises,
    Expression<String>? days,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exercises != null) 'exercises': exercises,
      if (days != null) 'days': days,
    });
  }

  PlansCompanion copyWith(
      {Value<int>? id, Value<String>? exercises, Value<String>? days}) {
    return PlansCompanion(
      id: id ?? this.id,
      exercises: exercises ?? this.exercises,
      days: days ?? this.days,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (exercises.present) {
      map['exercises'] = Variable<String>(exercises.value);
    }
    if (days.present) {
      map['days'] = Variable<String>(days.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlansCompanion(')
          ..write('id: $id, ')
          ..write('exercises: $exercises, ')
          ..write('days: $days')
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
  @override
  List<GeneratedColumn> get $columns => [id, name, reps, weight, unit, created];
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
  const GymSetsData(
      {required this.id,
      required this.name,
      required this.reps,
      required this.weight,
      required this.unit,
      required this.created});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['reps'] = Variable<double>(reps);
    map['weight'] = Variable<double>(weight);
    map['unit'] = Variable<String>(unit);
    map['created'] = Variable<DateTime>(created);
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
    };
  }

  GymSetsData copyWith(
          {int? id,
          String? name,
          double? reps,
          double? weight,
          String? unit,
          DateTime? created}) =>
      GymSetsData(
        id: id ?? this.id,
        name: name ?? this.name,
        reps: reps ?? this.reps,
        weight: weight ?? this.weight,
        unit: unit ?? this.unit,
        created: created ?? this.created,
      );
  GymSetsData copyWithCompanion(GymSetsCompanion data) {
    return GymSetsData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      reps: data.reps.present ? data.reps.value : this.reps,
      weight: data.weight.present ? data.weight.value : this.weight,
      unit: data.unit.present ? data.unit.value : this.unit,
      created: data.created.present ? data.created.value : this.created,
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
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, reps, weight, unit, created);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GymSetsData &&
          other.id == this.id &&
          other.name == this.name &&
          other.reps == this.reps &&
          other.weight == this.weight &&
          other.unit == this.unit &&
          other.created == this.created);
}

class GymSetsCompanion extends UpdateCompanion<GymSetsData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> reps;
  final Value<double> weight;
  final Value<String> unit;
  final Value<DateTime> created;
  const GymSetsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.unit = const Value.absent(),
    this.created = const Value.absent(),
  });
  GymSetsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double reps,
    required double weight,
    required String unit,
    required DateTime created,
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
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (reps != null) 'reps': reps,
      if (weight != null) 'weight': weight,
      if (unit != null) 'unit': unit,
      if (created != null) 'created': created,
    });
  }

  GymSetsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? reps,
      Value<double>? weight,
      Value<String>? unit,
      Value<DateTime>? created}) {
    return GymSetsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      unit: unit ?? this.unit,
      created: created ?? this.created,
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
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final Plans plans = Plans(this);
  late final GymSets gymSets = GymSets(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [plans, gymSets];
  @override
  int get schemaVersion => 2;
}
