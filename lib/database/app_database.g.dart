// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $EventsTableTable extends EventsTable
    with TableInfo<$EventsTableTable, EventsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _eventTypeMeta = const VerificationMeta(
    'eventType',
  );
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
    'event_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PERSONAL'),
  );
  static const VerificationMeta _calendarTypeMeta = const VerificationMeta(
    'calendarType',
  );
  @override
  late final GeneratedColumn<String> calendarType = GeneratedColumn<String>(
    'calendar_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('GREGORIAN'),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<String> startDate = GeneratedColumn<String>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<String> endDate = GeneratedColumn<String>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recurrenceJsonMeta = const VerificationMeta(
    'recurrenceJson',
  );
  @override
  late final GeneratedColumn<String> recurrenceJson = GeneratedColumn<String>(
    'recurrence_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    eventType,
    calendarType,
    startDate,
    endDate,
    recurrenceJson,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('event_type')) {
      context.handle(
        _eventTypeMeta,
        eventType.isAcceptableOrUnknown(data['event_type']!, _eventTypeMeta),
      );
    }
    if (data.containsKey('calendar_type')) {
      context.handle(
        _calendarTypeMeta,
        calendarType.isAcceptableOrUnknown(
          data['calendar_type']!,
          _calendarTypeMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('recurrence_json')) {
      context.handle(
        _recurrenceJsonMeta,
        recurrenceJson.isAcceptableOrUnknown(
          data['recurrence_json']!,
          _recurrenceJsonMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      eventType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_type'],
      )!,
      calendarType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calendar_type'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_date'],
      ),
      recurrenceJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recurrence_json'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $EventsTableTable createAlias(String alias) {
    return $EventsTableTable(attachedDatabase, alias);
  }
}

class EventsTableData extends DataClass implements Insertable<EventsTableData> {
  /// UUID primary key.
  final String id;

  /// Event title.
  final String title;

  /// Optional description.
  final String? description;

  /// Type: PERSONAL | ISLAMIC
  final String eventType;

  /// Calendar system: GREGORIAN | HIJRI
  final String calendarType;

  /// ISO 8601 date string for the start (YYYY-MM-DD).
  final String startDate;

  /// ISO 8601 date string for the end (YYYY-MM-DD). Nullable for single-day.
  final String? endDate;

  /// JSON-encoded recurrence rule. Null if no recurrence.
  final String? recurrenceJson;

  /// Whether this event is active.
  final bool isActive;

  /// Creation timestamp (Unix ms).
  final int createdAt;

  /// Last update timestamp (Unix ms).
  final int updatedAt;
  const EventsTableData({
    required this.id,
    required this.title,
    this.description,
    required this.eventType,
    required this.calendarType,
    required this.startDate,
    this.endDate,
    this.recurrenceJson,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['event_type'] = Variable<String>(eventType);
    map['calendar_type'] = Variable<String>(calendarType);
    map['start_date'] = Variable<String>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<String>(endDate);
    }
    if (!nullToAbsent || recurrenceJson != null) {
      map['recurrence_json'] = Variable<String>(recurrenceJson);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  EventsTableCompanion toCompanion(bool nullToAbsent) {
    return EventsTableCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      eventType: Value(eventType),
      calendarType: Value(calendarType),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      recurrenceJson: recurrenceJson == null && nullToAbsent
          ? const Value.absent()
          : Value(recurrenceJson),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory EventsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventsTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      eventType: serializer.fromJson<String>(json['eventType']),
      calendarType: serializer.fromJson<String>(json['calendarType']),
      startDate: serializer.fromJson<String>(json['startDate']),
      endDate: serializer.fromJson<String?>(json['endDate']),
      recurrenceJson: serializer.fromJson<String?>(json['recurrenceJson']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'eventType': serializer.toJson<String>(eventType),
      'calendarType': serializer.toJson<String>(calendarType),
      'startDate': serializer.toJson<String>(startDate),
      'endDate': serializer.toJson<String?>(endDate),
      'recurrenceJson': serializer.toJson<String?>(recurrenceJson),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  EventsTableData copyWith({
    String? id,
    String? title,
    Value<String?> description = const Value.absent(),
    String? eventType,
    String? calendarType,
    String? startDate,
    Value<String?> endDate = const Value.absent(),
    Value<String?> recurrenceJson = const Value.absent(),
    bool? isActive,
    int? createdAt,
    int? updatedAt,
  }) => EventsTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    eventType: eventType ?? this.eventType,
    calendarType: calendarType ?? this.calendarType,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    recurrenceJson: recurrenceJson.present
        ? recurrenceJson.value
        : this.recurrenceJson,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  EventsTableData copyWithCompanion(EventsTableCompanion data) {
    return EventsTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
      calendarType: data.calendarType.present
          ? data.calendarType.value
          : this.calendarType,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      recurrenceJson: data.recurrenceJson.present
          ? data.recurrenceJson.value
          : this.recurrenceJson,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventsTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('eventType: $eventType, ')
          ..write('calendarType: $calendarType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('recurrenceJson: $recurrenceJson, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    eventType,
    calendarType,
    startDate,
    endDate,
    recurrenceJson,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.eventType == this.eventType &&
          other.calendarType == this.calendarType &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.recurrenceJson == this.recurrenceJson &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EventsTableCompanion extends UpdateCompanion<EventsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> eventType;
  final Value<String> calendarType;
  final Value<String> startDate;
  final Value<String?> endDate;
  final Value<String?> recurrenceJson;
  final Value<bool> isActive;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const EventsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.eventType = const Value.absent(),
    this.calendarType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.recurrenceJson = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsTableCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    this.eventType = const Value.absent(),
    this.calendarType = const Value.absent(),
    required String startDate,
    this.endDate = const Value.absent(),
    this.recurrenceJson = const Value.absent(),
    this.isActive = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       startDate = Value(startDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<EventsTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? eventType,
    Expression<String>? calendarType,
    Expression<String>? startDate,
    Expression<String>? endDate,
    Expression<String>? recurrenceJson,
    Expression<bool>? isActive,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (eventType != null) 'event_type': eventType,
      if (calendarType != null) 'calendar_type': calendarType,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (recurrenceJson != null) 'recurrence_json': recurrenceJson,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? description,
    Value<String>? eventType,
    Value<String>? calendarType,
    Value<String>? startDate,
    Value<String?>? endDate,
    Value<String?>? recurrenceJson,
    Value<bool>? isActive,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return EventsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      eventType: eventType ?? this.eventType,
      calendarType: calendarType ?? this.calendarType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      recurrenceJson: recurrenceJson ?? this.recurrenceJson,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (calendarType.present) {
      map['calendar_type'] = Variable<String>(calendarType.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    if (recurrenceJson.present) {
      map['recurrence_json'] = Variable<String>(recurrenceJson.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('eventType: $eventType, ')
          ..write('calendarType: $calendarType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('recurrenceJson: $recurrenceJson, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventRemindersTableTable extends EventRemindersTable
    with TableInfo<$EventRemindersTableTable, EventRemindersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventRemindersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _minutesBeforeMeta = const VerificationMeta(
    'minutesBefore',
  );
  @override
  late final GeneratedColumn<int> minutesBefore = GeneratedColumn<int>(
    'minutes_before',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notificationIdMeta = const VerificationMeta(
    'notificationId',
  );
  @override
  late final GeneratedColumn<int> notificationId = GeneratedColumn<int>(
    'notification_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    eventId,
    minutesBefore,
    notificationId,
    isEnabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventRemindersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('minutes_before')) {
      context.handle(
        _minutesBeforeMeta,
        minutesBefore.isAcceptableOrUnknown(
          data['minutes_before']!,
          _minutesBeforeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minutesBeforeMeta);
    }
    if (data.containsKey('notification_id')) {
      context.handle(
        _notificationIdMeta,
        notificationId.isAcceptableOrUnknown(
          data['notification_id']!,
          _notificationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notificationIdMeta);
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventRemindersTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventRemindersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_id'],
      )!,
      minutesBefore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minutes_before'],
      )!,
      notificationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}notification_id'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
    );
  }

  @override
  $EventRemindersTableTable createAlias(String alias) {
    return $EventRemindersTableTable(attachedDatabase, alias);
  }
}

class EventRemindersTableData extends DataClass
    implements Insertable<EventRemindersTableData> {
  /// UUID primary key.
  final String id;

  /// Foreign key to [EventsTable].
  final String eventId;

  /// Minutes before the event to fire the reminder.
  final int minutesBefore;

  /// The platform notification ID for this reminder.
  final int notificationId;

  /// Whether this reminder is enabled.
  final bool isEnabled;
  const EventRemindersTableData({
    required this.id,
    required this.eventId,
    required this.minutesBefore,
    required this.notificationId,
    required this.isEnabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['event_id'] = Variable<String>(eventId);
    map['minutes_before'] = Variable<int>(minutesBefore);
    map['notification_id'] = Variable<int>(notificationId);
    map['is_enabled'] = Variable<bool>(isEnabled);
    return map;
  }

  EventRemindersTableCompanion toCompanion(bool nullToAbsent) {
    return EventRemindersTableCompanion(
      id: Value(id),
      eventId: Value(eventId),
      minutesBefore: Value(minutesBefore),
      notificationId: Value(notificationId),
      isEnabled: Value(isEnabled),
    );
  }

  factory EventRemindersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventRemindersTableData(
      id: serializer.fromJson<String>(json['id']),
      eventId: serializer.fromJson<String>(json['eventId']),
      minutesBefore: serializer.fromJson<int>(json['minutesBefore']),
      notificationId: serializer.fromJson<int>(json['notificationId']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'eventId': serializer.toJson<String>(eventId),
      'minutesBefore': serializer.toJson<int>(minutesBefore),
      'notificationId': serializer.toJson<int>(notificationId),
      'isEnabled': serializer.toJson<bool>(isEnabled),
    };
  }

  EventRemindersTableData copyWith({
    String? id,
    String? eventId,
    int? minutesBefore,
    int? notificationId,
    bool? isEnabled,
  }) => EventRemindersTableData(
    id: id ?? this.id,
    eventId: eventId ?? this.eventId,
    minutesBefore: minutesBefore ?? this.minutesBefore,
    notificationId: notificationId ?? this.notificationId,
    isEnabled: isEnabled ?? this.isEnabled,
  );
  EventRemindersTableData copyWithCompanion(EventRemindersTableCompanion data) {
    return EventRemindersTableData(
      id: data.id.present ? data.id.value : this.id,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      minutesBefore: data.minutesBefore.present
          ? data.minutesBefore.value
          : this.minutesBefore,
      notificationId: data.notificationId.present
          ? data.notificationId.value
          : this.notificationId,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventRemindersTableData(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('minutesBefore: $minutesBefore, ')
          ..write('notificationId: $notificationId, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, eventId, minutesBefore, notificationId, isEnabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventRemindersTableData &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.minutesBefore == this.minutesBefore &&
          other.notificationId == this.notificationId &&
          other.isEnabled == this.isEnabled);
}

class EventRemindersTableCompanion
    extends UpdateCompanion<EventRemindersTableData> {
  final Value<String> id;
  final Value<String> eventId;
  final Value<int> minutesBefore;
  final Value<int> notificationId;
  final Value<bool> isEnabled;
  final Value<int> rowid;
  const EventRemindersTableCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.minutesBefore = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventRemindersTableCompanion.insert({
    required String id,
    required String eventId,
    required int minutesBefore,
    required int notificationId,
    this.isEnabled = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       eventId = Value(eventId),
       minutesBefore = Value(minutesBefore),
       notificationId = Value(notificationId);
  static Insertable<EventRemindersTableData> custom({
    Expression<String>? id,
    Expression<String>? eventId,
    Expression<int>? minutesBefore,
    Expression<int>? notificationId,
    Expression<bool>? isEnabled,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (minutesBefore != null) 'minutes_before': minutesBefore,
      if (notificationId != null) 'notification_id': notificationId,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventRemindersTableCompanion copyWith({
    Value<String>? id,
    Value<String>? eventId,
    Value<int>? minutesBefore,
    Value<int>? notificationId,
    Value<bool>? isEnabled,
    Value<int>? rowid,
  }) {
    return EventRemindersTableCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      minutesBefore: minutesBefore ?? this.minutesBefore,
      notificationId: notificationId ?? this.notificationId,
      isEnabled: isEnabled ?? this.isEnabled,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (minutesBefore.present) {
      map['minutes_before'] = Variable<int>(minutesBefore.value);
    }
    if (notificationId.present) {
      map['notification_id'] = Variable<int>(notificationId.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventRemindersTableCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('minutesBefore: $minutesBefore, ')
          ..write('notificationId: $notificationId, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserSettingsTableTable extends UserSettingsTable
    with TableInfo<$UserSettingsTableTable, UserSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _languageCodeMeta = const VerificationMeta(
    'languageCode',
  );
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
    'language_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('en'),
  );
  static const VerificationMeta _themeModeMeta = const VerificationMeta(
    'themeMode',
  );
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
    'theme_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('system'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, languageCode, themeMode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserSettingsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('language_code')) {
      context.handle(
        _languageCodeMeta,
        languageCode.isAcceptableOrUnknown(
          data['language_code']!,
          _languageCodeMeta,
        ),
      );
    }
    if (data.containsKey('theme_mode')) {
      context.handle(
        _themeModeMeta,
        themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserSettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSettingsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      languageCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language_code'],
      )!,
      themeMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_mode'],
      )!,
    );
  }

  @override
  $UserSettingsTableTable createAlias(String alias) {
    return $UserSettingsTableTable(attachedDatabase, alias);
  }
}

class UserSettingsTableData extends DataClass
    implements Insertable<UserSettingsTableData> {
  final int id;

  /// BCP 47 language code: 'en' | 'ar'
  final String languageCode;

  /// Theme mode: 'system' | 'light' | 'dark'
  final String themeMode;
  const UserSettingsTableData({
    required this.id,
    required this.languageCode,
    required this.themeMode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['language_code'] = Variable<String>(languageCode);
    map['theme_mode'] = Variable<String>(themeMode);
    return map;
  }

  UserSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsTableCompanion(
      id: Value(id),
      languageCode: Value(languageCode),
      themeMode: Value(themeMode),
    );
  }

  factory UserSettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      languageCode: serializer.fromJson<String>(json['languageCode']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'languageCode': serializer.toJson<String>(languageCode),
      'themeMode': serializer.toJson<String>(themeMode),
    };
  }

  UserSettingsTableData copyWith({
    int? id,
    String? languageCode,
    String? themeMode,
  }) => UserSettingsTableData(
    id: id ?? this.id,
    languageCode: languageCode ?? this.languageCode,
    themeMode: themeMode ?? this.themeMode,
  );
  UserSettingsTableData copyWithCompanion(UserSettingsTableCompanion data) {
    return UserSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      languageCode: data.languageCode.present
          ? data.languageCode.value
          : this.languageCode,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsTableData(')
          ..write('id: $id, ')
          ..write('languageCode: $languageCode, ')
          ..write('themeMode: $themeMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, languageCode, themeMode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSettingsTableData &&
          other.id == this.id &&
          other.languageCode == this.languageCode &&
          other.themeMode == this.themeMode);
}

class UserSettingsTableCompanion
    extends UpdateCompanion<UserSettingsTableData> {
  final Value<int> id;
  final Value<String> languageCode;
  final Value<String> themeMode;
  const UserSettingsTableCompanion({
    this.id = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.themeMode = const Value.absent(),
  });
  UserSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.languageCode = const Value.absent(),
    this.themeMode = const Value.absent(),
  });
  static Insertable<UserSettingsTableData> custom({
    Expression<int>? id,
    Expression<String>? languageCode,
    Expression<String>? themeMode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (languageCode != null) 'language_code': languageCode,
      if (themeMode != null) 'theme_mode': themeMode,
    });
  }

  UserSettingsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? languageCode,
    Value<String>? themeMode,
  }) {
    return UserSettingsTableCompanion(
      id: id ?? this.id,
      languageCode: languageCode ?? this.languageCode,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('languageCode: $languageCode, ')
          ..write('themeMode: $themeMode')
          ..write(')'))
        .toString();
  }
}

class $CalendarSettingsTableTable extends CalendarSettingsTable
    with TableInfo<$CalendarSettingsTableTable, CalendarSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _hijriMethodMeta = const VerificationMeta(
    'hijriMethod',
  );
  @override
  late final GeneratedColumn<String> hijriMethod = GeneratedColumn<String>(
    'hijri_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('UMM_AL_QURA'),
  );
  static const VerificationMeta _hijriAdjustmentMeta = const VerificationMeta(
    'hijriAdjustment',
  );
  @override
  late final GeneratedColumn<int> hijriAdjustment = GeneratedColumn<int>(
    'hijri_adjustment',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _primaryCalendarMeta = const VerificationMeta(
    'primaryCalendar',
  );
  @override
  late final GeneratedColumn<String> primaryCalendar = GeneratedColumn<String>(
    'primary_calendar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('GREGORIAN'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    hijriMethod,
    hijriAdjustment,
    primaryCalendar,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<CalendarSettingsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hijri_method')) {
      context.handle(
        _hijriMethodMeta,
        hijriMethod.isAcceptableOrUnknown(
          data['hijri_method']!,
          _hijriMethodMeta,
        ),
      );
    }
    if (data.containsKey('hijri_adjustment')) {
      context.handle(
        _hijriAdjustmentMeta,
        hijriAdjustment.isAcceptableOrUnknown(
          data['hijri_adjustment']!,
          _hijriAdjustmentMeta,
        ),
      );
    }
    if (data.containsKey('primary_calendar')) {
      context.handle(
        _primaryCalendarMeta,
        primaryCalendar.isAcceptableOrUnknown(
          data['primary_calendar']!,
          _primaryCalendarMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarSettingsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarSettingsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      hijriMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hijri_method'],
      )!,
      hijriAdjustment: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hijri_adjustment'],
      )!,
      primaryCalendar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}primary_calendar'],
      )!,
    );
  }

  @override
  $CalendarSettingsTableTable createAlias(String alias) {
    return $CalendarSettingsTableTable(attachedDatabase, alias);
  }
}

class CalendarSettingsTableData extends DataClass
    implements Insertable<CalendarSettingsTableData> {
  final int id;

  /// Hijri calculation method: UMM_AL_QURA | TABULAR_CIVIL | TABULAR_ASTRONOMICAL
  final String hijriMethod;

  /// User-configured Hijri adjustment: -2 to +2
  final int hijriAdjustment;

  /// Primary calendar to display: GREGORIAN | HIJRI | DUAL
  final String primaryCalendar;
  const CalendarSettingsTableData({
    required this.id,
    required this.hijriMethod,
    required this.hijriAdjustment,
    required this.primaryCalendar,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hijri_method'] = Variable<String>(hijriMethod);
    map['hijri_adjustment'] = Variable<int>(hijriAdjustment);
    map['primary_calendar'] = Variable<String>(primaryCalendar);
    return map;
  }

  CalendarSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return CalendarSettingsTableCompanion(
      id: Value(id),
      hijriMethod: Value(hijriMethod),
      hijriAdjustment: Value(hijriAdjustment),
      primaryCalendar: Value(primaryCalendar),
    );
  }

  factory CalendarSettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarSettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      hijriMethod: serializer.fromJson<String>(json['hijriMethod']),
      hijriAdjustment: serializer.fromJson<int>(json['hijriAdjustment']),
      primaryCalendar: serializer.fromJson<String>(json['primaryCalendar']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hijriMethod': serializer.toJson<String>(hijriMethod),
      'hijriAdjustment': serializer.toJson<int>(hijriAdjustment),
      'primaryCalendar': serializer.toJson<String>(primaryCalendar),
    };
  }

  CalendarSettingsTableData copyWith({
    int? id,
    String? hijriMethod,
    int? hijriAdjustment,
    String? primaryCalendar,
  }) => CalendarSettingsTableData(
    id: id ?? this.id,
    hijriMethod: hijriMethod ?? this.hijriMethod,
    hijriAdjustment: hijriAdjustment ?? this.hijriAdjustment,
    primaryCalendar: primaryCalendar ?? this.primaryCalendar,
  );
  CalendarSettingsTableData copyWithCompanion(
    CalendarSettingsTableCompanion data,
  ) {
    return CalendarSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      hijriMethod: data.hijriMethod.present
          ? data.hijriMethod.value
          : this.hijriMethod,
      hijriAdjustment: data.hijriAdjustment.present
          ? data.hijriAdjustment.value
          : this.hijriAdjustment,
      primaryCalendar: data.primaryCalendar.present
          ? data.primaryCalendar.value
          : this.primaryCalendar,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarSettingsTableData(')
          ..write('id: $id, ')
          ..write('hijriMethod: $hijriMethod, ')
          ..write('hijriAdjustment: $hijriAdjustment, ')
          ..write('primaryCalendar: $primaryCalendar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, hijriMethod, hijriAdjustment, primaryCalendar);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarSettingsTableData &&
          other.id == this.id &&
          other.hijriMethod == this.hijriMethod &&
          other.hijriAdjustment == this.hijriAdjustment &&
          other.primaryCalendar == this.primaryCalendar);
}

class CalendarSettingsTableCompanion
    extends UpdateCompanion<CalendarSettingsTableData> {
  final Value<int> id;
  final Value<String> hijriMethod;
  final Value<int> hijriAdjustment;
  final Value<String> primaryCalendar;
  const CalendarSettingsTableCompanion({
    this.id = const Value.absent(),
    this.hijriMethod = const Value.absent(),
    this.hijriAdjustment = const Value.absent(),
    this.primaryCalendar = const Value.absent(),
  });
  CalendarSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.hijriMethod = const Value.absent(),
    this.hijriAdjustment = const Value.absent(),
    this.primaryCalendar = const Value.absent(),
  });
  static Insertable<CalendarSettingsTableData> custom({
    Expression<int>? id,
    Expression<String>? hijriMethod,
    Expression<int>? hijriAdjustment,
    Expression<String>? primaryCalendar,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hijriMethod != null) 'hijri_method': hijriMethod,
      if (hijriAdjustment != null) 'hijri_adjustment': hijriAdjustment,
      if (primaryCalendar != null) 'primary_calendar': primaryCalendar,
    });
  }

  CalendarSettingsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? hijriMethod,
    Value<int>? hijriAdjustment,
    Value<String>? primaryCalendar,
  }) {
    return CalendarSettingsTableCompanion(
      id: id ?? this.id,
      hijriMethod: hijriMethod ?? this.hijriMethod,
      hijriAdjustment: hijriAdjustment ?? this.hijriAdjustment,
      primaryCalendar: primaryCalendar ?? this.primaryCalendar,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hijriMethod.present) {
      map['hijri_method'] = Variable<String>(hijriMethod.value);
    }
    if (hijriAdjustment.present) {
      map['hijri_adjustment'] = Variable<int>(hijriAdjustment.value);
    }
    if (primaryCalendar.present) {
      map['primary_calendar'] = Variable<String>(primaryCalendar.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('hijriMethod: $hijriMethod, ')
          ..write('hijriAdjustment: $hijriAdjustment, ')
          ..write('primaryCalendar: $primaryCalendar')
          ..write(')'))
        .toString();
  }
}

class $PrayerSettingsTableTable extends PrayerSettingsTable
    with TableInfo<$PrayerSettingsTableTable, PrayerSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayerSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _calculationMethodMeta = const VerificationMeta(
    'calculationMethod',
  );
  @override
  late final GeneratedColumn<String> calculationMethod =
      GeneratedColumn<String>(
        'calculation_method',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('MWL'),
      );
  static const VerificationMeta _asrMethodMeta = const VerificationMeta(
    'asrMethod',
  );
  @override
  late final GeneratedColumn<String> asrMethod = GeneratedColumn<String>(
    'asr_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('STANDARD'),
  );
  static const VerificationMeta _highLatitudeRuleMeta = const VerificationMeta(
    'highLatitudeRule',
  );
  @override
  late final GeneratedColumn<String> highLatitudeRule = GeneratedColumn<String>(
    'high_latitude_rule',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('MIDDLE_OF_NIGHT'),
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    calculationMethod,
    asrMethod,
    highLatitudeRule,
    enabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayer_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrayerSettingsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('calculation_method')) {
      context.handle(
        _calculationMethodMeta,
        calculationMethod.isAcceptableOrUnknown(
          data['calculation_method']!,
          _calculationMethodMeta,
        ),
      );
    }
    if (data.containsKey('asr_method')) {
      context.handle(
        _asrMethodMeta,
        asrMethod.isAcceptableOrUnknown(data['asr_method']!, _asrMethodMeta),
      );
    }
    if (data.containsKey('high_latitude_rule')) {
      context.handle(
        _highLatitudeRuleMeta,
        highLatitudeRule.isAcceptableOrUnknown(
          data['high_latitude_rule']!,
          _highLatitudeRuleMeta,
        ),
      );
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrayerSettingsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrayerSettingsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      calculationMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calculation_method'],
      )!,
      asrMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}asr_method'],
      )!,
      highLatitudeRule: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}high_latitude_rule'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
    );
  }

  @override
  $PrayerSettingsTableTable createAlias(String alias) {
    return $PrayerSettingsTableTable(attachedDatabase, alias);
  }
}

class PrayerSettingsTableData extends DataClass
    implements Insertable<PrayerSettingsTableData> {
  final int id;

  /// Calculation method name (e.g. MWL, ISNA, UMM_AL_QURA).
  final String calculationMethod;

  /// Asr method: STANDARD | HANAFI
  final String asrMethod;

  /// High latitude rule: MIDDLE_OF_NIGHT | ONE_SEVENTH | ANGLE_BASED
  final String highLatitudeRule;

  /// Whether the prayer feature is enabled.
  final bool enabled;
  const PrayerSettingsTableData({
    required this.id,
    required this.calculationMethod,
    required this.asrMethod,
    required this.highLatitudeRule,
    required this.enabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['calculation_method'] = Variable<String>(calculationMethod);
    map['asr_method'] = Variable<String>(asrMethod);
    map['high_latitude_rule'] = Variable<String>(highLatitudeRule);
    map['enabled'] = Variable<bool>(enabled);
    return map;
  }

  PrayerSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return PrayerSettingsTableCompanion(
      id: Value(id),
      calculationMethod: Value(calculationMethod),
      asrMethod: Value(asrMethod),
      highLatitudeRule: Value(highLatitudeRule),
      enabled: Value(enabled),
    );
  }

  factory PrayerSettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerSettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      calculationMethod: serializer.fromJson<String>(json['calculationMethod']),
      asrMethod: serializer.fromJson<String>(json['asrMethod']),
      highLatitudeRule: serializer.fromJson<String>(json['highLatitudeRule']),
      enabled: serializer.fromJson<bool>(json['enabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'calculationMethod': serializer.toJson<String>(calculationMethod),
      'asrMethod': serializer.toJson<String>(asrMethod),
      'highLatitudeRule': serializer.toJson<String>(highLatitudeRule),
      'enabled': serializer.toJson<bool>(enabled),
    };
  }

  PrayerSettingsTableData copyWith({
    int? id,
    String? calculationMethod,
    String? asrMethod,
    String? highLatitudeRule,
    bool? enabled,
  }) => PrayerSettingsTableData(
    id: id ?? this.id,
    calculationMethod: calculationMethod ?? this.calculationMethod,
    asrMethod: asrMethod ?? this.asrMethod,
    highLatitudeRule: highLatitudeRule ?? this.highLatitudeRule,
    enabled: enabled ?? this.enabled,
  );
  PrayerSettingsTableData copyWithCompanion(PrayerSettingsTableCompanion data) {
    return PrayerSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      calculationMethod: data.calculationMethod.present
          ? data.calculationMethod.value
          : this.calculationMethod,
      asrMethod: data.asrMethod.present ? data.asrMethod.value : this.asrMethod,
      highLatitudeRule: data.highLatitudeRule.present
          ? data.highLatitudeRule.value
          : this.highLatitudeRule,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrayerSettingsTableData(')
          ..write('id: $id, ')
          ..write('calculationMethod: $calculationMethod, ')
          ..write('asrMethod: $asrMethod, ')
          ..write('highLatitudeRule: $highLatitudeRule, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, calculationMethod, asrMethod, highLatitudeRule, enabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerSettingsTableData &&
          other.id == this.id &&
          other.calculationMethod == this.calculationMethod &&
          other.asrMethod == this.asrMethod &&
          other.highLatitudeRule == this.highLatitudeRule &&
          other.enabled == this.enabled);
}

class PrayerSettingsTableCompanion
    extends UpdateCompanion<PrayerSettingsTableData> {
  final Value<int> id;
  final Value<String> calculationMethod;
  final Value<String> asrMethod;
  final Value<String> highLatitudeRule;
  final Value<bool> enabled;
  const PrayerSettingsTableCompanion({
    this.id = const Value.absent(),
    this.calculationMethod = const Value.absent(),
    this.asrMethod = const Value.absent(),
    this.highLatitudeRule = const Value.absent(),
    this.enabled = const Value.absent(),
  });
  PrayerSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.calculationMethod = const Value.absent(),
    this.asrMethod = const Value.absent(),
    this.highLatitudeRule = const Value.absent(),
    this.enabled = const Value.absent(),
  });
  static Insertable<PrayerSettingsTableData> custom({
    Expression<int>? id,
    Expression<String>? calculationMethod,
    Expression<String>? asrMethod,
    Expression<String>? highLatitudeRule,
    Expression<bool>? enabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (calculationMethod != null) 'calculation_method': calculationMethod,
      if (asrMethod != null) 'asr_method': asrMethod,
      if (highLatitudeRule != null) 'high_latitude_rule': highLatitudeRule,
      if (enabled != null) 'enabled': enabled,
    });
  }

  PrayerSettingsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? calculationMethod,
    Value<String>? asrMethod,
    Value<String>? highLatitudeRule,
    Value<bool>? enabled,
  }) {
    return PrayerSettingsTableCompanion(
      id: id ?? this.id,
      calculationMethod: calculationMethod ?? this.calculationMethod,
      asrMethod: asrMethod ?? this.asrMethod,
      highLatitudeRule: highLatitudeRule ?? this.highLatitudeRule,
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (calculationMethod.present) {
      map['calculation_method'] = Variable<String>(calculationMethod.value);
    }
    if (asrMethod.present) {
      map['asr_method'] = Variable<String>(asrMethod.value);
    }
    if (highLatitudeRule.present) {
      map['high_latitude_rule'] = Variable<String>(highLatitudeRule.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('calculationMethod: $calculationMethod, ')
          ..write('asrMethod: $asrMethod, ')
          ..write('highLatitudeRule: $highLatitudeRule, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }
}

class $NotificationSettingsTableTable extends NotificationSettingsTable
    with
        TableInfo<
          $NotificationSettingsTableTable,
          NotificationSettingsTableData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _eventRemindersMeta = const VerificationMeta(
    'eventReminders',
  );
  @override
  late final GeneratedColumn<bool> eventReminders = GeneratedColumn<bool>(
    'event_reminders',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("event_reminders" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _islamicEventRemindersMeta =
      const VerificationMeta('islamicEventReminders');
  @override
  late final GeneratedColumn<bool> islamicEventReminders =
      GeneratedColumn<bool>(
        'islamic_event_reminders',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("islamic_event_reminders" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  static const VerificationMeta _dailyReminderMeta = const VerificationMeta(
    'dailyReminder',
  );
  @override
  late final GeneratedColumn<bool> dailyReminder = GeneratedColumn<bool>(
    'daily_reminder',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("daily_reminder" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _prayerRemindersMeta = const VerificationMeta(
    'prayerReminders',
  );
  @override
  late final GeneratedColumn<bool> prayerReminders = GeneratedColumn<bool>(
    'prayer_reminders',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("prayer_reminders" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _dailyReminderTimeMeta = const VerificationMeta(
    'dailyReminderTime',
  );
  @override
  late final GeneratedColumn<String> dailyReminderTime =
      GeneratedColumn<String>(
        'daily_reminder_time',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('07:00'),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    eventReminders,
    islamicEventReminders,
    dailyReminder,
    prayerReminders,
    dailyReminderTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotificationSettingsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_reminders')) {
      context.handle(
        _eventRemindersMeta,
        eventReminders.isAcceptableOrUnknown(
          data['event_reminders']!,
          _eventRemindersMeta,
        ),
      );
    }
    if (data.containsKey('islamic_event_reminders')) {
      context.handle(
        _islamicEventRemindersMeta,
        islamicEventReminders.isAcceptableOrUnknown(
          data['islamic_event_reminders']!,
          _islamicEventRemindersMeta,
        ),
      );
    }
    if (data.containsKey('daily_reminder')) {
      context.handle(
        _dailyReminderMeta,
        dailyReminder.isAcceptableOrUnknown(
          data['daily_reminder']!,
          _dailyReminderMeta,
        ),
      );
    }
    if (data.containsKey('prayer_reminders')) {
      context.handle(
        _prayerRemindersMeta,
        prayerReminders.isAcceptableOrUnknown(
          data['prayer_reminders']!,
          _prayerRemindersMeta,
        ),
      );
    }
    if (data.containsKey('daily_reminder_time')) {
      context.handle(
        _dailyReminderTimeMeta,
        dailyReminderTime.isAcceptableOrUnknown(
          data['daily_reminder_time']!,
          _dailyReminderTimeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationSettingsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationSettingsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      eventReminders: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}event_reminders'],
      )!,
      islamicEventReminders: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}islamic_event_reminders'],
      )!,
      dailyReminder: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}daily_reminder'],
      )!,
      prayerReminders: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}prayer_reminders'],
      )!,
      dailyReminderTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}daily_reminder_time'],
      )!,
    );
  }

  @override
  $NotificationSettingsTableTable createAlias(String alias) {
    return $NotificationSettingsTableTable(attachedDatabase, alias);
  }
}

class NotificationSettingsTableData extends DataClass
    implements Insertable<NotificationSettingsTableData> {
  final int id;
  final bool eventReminders;
  final bool islamicEventReminders;
  final bool dailyReminder;
  final bool prayerReminders;

  /// Time for the daily reminder in HH:mm format.
  final String dailyReminderTime;
  const NotificationSettingsTableData({
    required this.id,
    required this.eventReminders,
    required this.islamicEventReminders,
    required this.dailyReminder,
    required this.prayerReminders,
    required this.dailyReminderTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_reminders'] = Variable<bool>(eventReminders);
    map['islamic_event_reminders'] = Variable<bool>(islamicEventReminders);
    map['daily_reminder'] = Variable<bool>(dailyReminder);
    map['prayer_reminders'] = Variable<bool>(prayerReminders);
    map['daily_reminder_time'] = Variable<String>(dailyReminderTime);
    return map;
  }

  NotificationSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return NotificationSettingsTableCompanion(
      id: Value(id),
      eventReminders: Value(eventReminders),
      islamicEventReminders: Value(islamicEventReminders),
      dailyReminder: Value(dailyReminder),
      prayerReminders: Value(prayerReminders),
      dailyReminderTime: Value(dailyReminderTime),
    );
  }

  factory NotificationSettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationSettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      eventReminders: serializer.fromJson<bool>(json['eventReminders']),
      islamicEventReminders: serializer.fromJson<bool>(
        json['islamicEventReminders'],
      ),
      dailyReminder: serializer.fromJson<bool>(json['dailyReminder']),
      prayerReminders: serializer.fromJson<bool>(json['prayerReminders']),
      dailyReminderTime: serializer.fromJson<String>(json['dailyReminderTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventReminders': serializer.toJson<bool>(eventReminders),
      'islamicEventReminders': serializer.toJson<bool>(islamicEventReminders),
      'dailyReminder': serializer.toJson<bool>(dailyReminder),
      'prayerReminders': serializer.toJson<bool>(prayerReminders),
      'dailyReminderTime': serializer.toJson<String>(dailyReminderTime),
    };
  }

  NotificationSettingsTableData copyWith({
    int? id,
    bool? eventReminders,
    bool? islamicEventReminders,
    bool? dailyReminder,
    bool? prayerReminders,
    String? dailyReminderTime,
  }) => NotificationSettingsTableData(
    id: id ?? this.id,
    eventReminders: eventReminders ?? this.eventReminders,
    islamicEventReminders: islamicEventReminders ?? this.islamicEventReminders,
    dailyReminder: dailyReminder ?? this.dailyReminder,
    prayerReminders: prayerReminders ?? this.prayerReminders,
    dailyReminderTime: dailyReminderTime ?? this.dailyReminderTime,
  );
  NotificationSettingsTableData copyWithCompanion(
    NotificationSettingsTableCompanion data,
  ) {
    return NotificationSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      eventReminders: data.eventReminders.present
          ? data.eventReminders.value
          : this.eventReminders,
      islamicEventReminders: data.islamicEventReminders.present
          ? data.islamicEventReminders.value
          : this.islamicEventReminders,
      dailyReminder: data.dailyReminder.present
          ? data.dailyReminder.value
          : this.dailyReminder,
      prayerReminders: data.prayerReminders.present
          ? data.prayerReminders.value
          : this.prayerReminders,
      dailyReminderTime: data.dailyReminderTime.present
          ? data.dailyReminderTime.value
          : this.dailyReminderTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationSettingsTableData(')
          ..write('id: $id, ')
          ..write('eventReminders: $eventReminders, ')
          ..write('islamicEventReminders: $islamicEventReminders, ')
          ..write('dailyReminder: $dailyReminder, ')
          ..write('prayerReminders: $prayerReminders, ')
          ..write('dailyReminderTime: $dailyReminderTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    eventReminders,
    islamicEventReminders,
    dailyReminder,
    prayerReminders,
    dailyReminderTime,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationSettingsTableData &&
          other.id == this.id &&
          other.eventReminders == this.eventReminders &&
          other.islamicEventReminders == this.islamicEventReminders &&
          other.dailyReminder == this.dailyReminder &&
          other.prayerReminders == this.prayerReminders &&
          other.dailyReminderTime == this.dailyReminderTime);
}

class NotificationSettingsTableCompanion
    extends UpdateCompanion<NotificationSettingsTableData> {
  final Value<int> id;
  final Value<bool> eventReminders;
  final Value<bool> islamicEventReminders;
  final Value<bool> dailyReminder;
  final Value<bool> prayerReminders;
  final Value<String> dailyReminderTime;
  const NotificationSettingsTableCompanion({
    this.id = const Value.absent(),
    this.eventReminders = const Value.absent(),
    this.islamicEventReminders = const Value.absent(),
    this.dailyReminder = const Value.absent(),
    this.prayerReminders = const Value.absent(),
    this.dailyReminderTime = const Value.absent(),
  });
  NotificationSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.eventReminders = const Value.absent(),
    this.islamicEventReminders = const Value.absent(),
    this.dailyReminder = const Value.absent(),
    this.prayerReminders = const Value.absent(),
    this.dailyReminderTime = const Value.absent(),
  });
  static Insertable<NotificationSettingsTableData> custom({
    Expression<int>? id,
    Expression<bool>? eventReminders,
    Expression<bool>? islamicEventReminders,
    Expression<bool>? dailyReminder,
    Expression<bool>? prayerReminders,
    Expression<String>? dailyReminderTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventReminders != null) 'event_reminders': eventReminders,
      if (islamicEventReminders != null)
        'islamic_event_reminders': islamicEventReminders,
      if (dailyReminder != null) 'daily_reminder': dailyReminder,
      if (prayerReminders != null) 'prayer_reminders': prayerReminders,
      if (dailyReminderTime != null) 'daily_reminder_time': dailyReminderTime,
    });
  }

  NotificationSettingsTableCompanion copyWith({
    Value<int>? id,
    Value<bool>? eventReminders,
    Value<bool>? islamicEventReminders,
    Value<bool>? dailyReminder,
    Value<bool>? prayerReminders,
    Value<String>? dailyReminderTime,
  }) {
    return NotificationSettingsTableCompanion(
      id: id ?? this.id,
      eventReminders: eventReminders ?? this.eventReminders,
      islamicEventReminders:
          islamicEventReminders ?? this.islamicEventReminders,
      dailyReminder: dailyReminder ?? this.dailyReminder,
      prayerReminders: prayerReminders ?? this.prayerReminders,
      dailyReminderTime: dailyReminderTime ?? this.dailyReminderTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventReminders.present) {
      map['event_reminders'] = Variable<bool>(eventReminders.value);
    }
    if (islamicEventReminders.present) {
      map['islamic_event_reminders'] = Variable<bool>(
        islamicEventReminders.value,
      );
    }
    if (dailyReminder.present) {
      map['daily_reminder'] = Variable<bool>(dailyReminder.value);
    }
    if (prayerReminders.present) {
      map['prayer_reminders'] = Variable<bool>(prayerReminders.value);
    }
    if (dailyReminderTime.present) {
      map['daily_reminder_time'] = Variable<String>(dailyReminderTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('eventReminders: $eventReminders, ')
          ..write('islamicEventReminders: $islamicEventReminders, ')
          ..write('dailyReminder: $dailyReminder, ')
          ..write('prayerReminders: $prayerReminders, ')
          ..write('dailyReminderTime: $dailyReminderTime')
          ..write(')'))
        .toString();
  }
}

class $LocationsTableTable extends LocationsTable
    with TableInfo<$LocationsTableTable, LocationsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('MANUAL'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    latitude,
    longitude,
    timezone,
    city,
    country,
    source,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'locations';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    } else if (isInserting) {
      context.missing(_timezoneMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      )!,
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LocationsTableTable createAlias(String alias) {
    return $LocationsTableTable(attachedDatabase, alias);
  }
}

class LocationsTableData extends DataClass
    implements Insertable<LocationsTableData> {
  final int id;

  /// WGS-84 latitude.
  final double latitude;

  /// WGS-84 longitude.
  final double longitude;

  /// IANA timezone ID (e.g. 'Asia/Kolkata').
  final String timezone;

  /// Human-readable city name.
  final String city;

  /// ISO 3166-1 alpha-2 country code.
  final String country;

  /// Source: GPS | MANUAL
  final String source;

  /// Timestamp of last update (Unix ms).
  final int updatedAt;
  const LocationsTableData({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.city,
    required this.country,
    required this.source,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['timezone'] = Variable<String>(timezone);
    map['city'] = Variable<String>(city);
    map['country'] = Variable<String>(country);
    map['source'] = Variable<String>(source);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  LocationsTableCompanion toCompanion(bool nullToAbsent) {
    return LocationsTableCompanion(
      id: Value(id),
      latitude: Value(latitude),
      longitude: Value(longitude),
      timezone: Value(timezone),
      city: Value(city),
      country: Value(country),
      source: Value(source),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocationsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationsTableData(
      id: serializer.fromJson<int>(json['id']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      timezone: serializer.fromJson<String>(json['timezone']),
      city: serializer.fromJson<String>(json['city']),
      country: serializer.fromJson<String>(json['country']),
      source: serializer.fromJson<String>(json['source']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'timezone': serializer.toJson<String>(timezone),
      'city': serializer.toJson<String>(city),
      'country': serializer.toJson<String>(country),
      'source': serializer.toJson<String>(source),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  LocationsTableData copyWith({
    int? id,
    double? latitude,
    double? longitude,
    String? timezone,
    String? city,
    String? country,
    String? source,
    int? updatedAt,
  }) => LocationsTableData(
    id: id ?? this.id,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    timezone: timezone ?? this.timezone,
    city: city ?? this.city,
    country: country ?? this.country,
    source: source ?? this.source,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LocationsTableData copyWithCompanion(LocationsTableCompanion data) {
    return LocationsTableData(
      id: data.id.present ? data.id.value : this.id,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      city: data.city.present ? data.city.value : this.city,
      country: data.country.present ? data.country.value : this.country,
      source: data.source.present ? data.source.value : this.source,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationsTableData(')
          ..write('id: $id, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('timezone: $timezone, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('source: $source, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    latitude,
    longitude,
    timezone,
    city,
    country,
    source,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationsTableData &&
          other.id == this.id &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.timezone == this.timezone &&
          other.city == this.city &&
          other.country == this.country &&
          other.source == this.source &&
          other.updatedAt == this.updatedAt);
}

class LocationsTableCompanion extends UpdateCompanion<LocationsTableData> {
  final Value<int> id;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> timezone;
  final Value<String> city;
  final Value<String> country;
  final Value<String> source;
  final Value<int> updatedAt;
  const LocationsTableCompanion({
    this.id = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.timezone = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.source = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  LocationsTableCompanion.insert({
    this.id = const Value.absent(),
    required double latitude,
    required double longitude,
    required String timezone,
    required String city,
    required String country,
    this.source = const Value.absent(),
    required int updatedAt,
  }) : latitude = Value(latitude),
       longitude = Value(longitude),
       timezone = Value(timezone),
       city = Value(city),
       country = Value(country),
       updatedAt = Value(updatedAt);
  static Insertable<LocationsTableData> custom({
    Expression<int>? id,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? timezone,
    Expression<String>? city,
    Expression<String>? country,
    Expression<String>? source,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (timezone != null) 'timezone': timezone,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (source != null) 'source': source,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  LocationsTableCompanion copyWith({
    Value<int>? id,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<String>? timezone,
    Value<String>? city,
    Value<String>? country,
    Value<String>? source,
    Value<int>? updatedAt,
  }) {
    return LocationsTableCompanion(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timezone: timezone ?? this.timezone,
      city: city ?? this.city,
      country: country ?? this.country,
      source: source ?? this.source,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationsTableCompanion(')
          ..write('id: $id, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('timezone: $timezone, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('source: $source, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CalendarOverridesTableTable extends CalendarOverridesTable
    with TableInfo<$CalendarOverridesTableTable, CalendarOverridesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarOverridesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _gregorianDateMeta = const VerificationMeta(
    'gregorianDate',
  );
  @override
  late final GeneratedColumn<String> gregorianDate = GeneratedColumn<String>(
    'gregorian_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hijriYearMeta = const VerificationMeta(
    'hijriYear',
  );
  @override
  late final GeneratedColumn<int> hijriYear = GeneratedColumn<int>(
    'hijri_year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hijriMonthMeta = const VerificationMeta(
    'hijriMonth',
  );
  @override
  late final GeneratedColumn<int> hijriMonth = GeneratedColumn<int>(
    'hijri_month',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hijriDayMeta = const VerificationMeta(
    'hijriDay',
  );
  @override
  late final GeneratedColumn<int> hijriDay = GeneratedColumn<int>(
    'hijri_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('OFFICIAL'),
  );
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
    'region',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    gregorianDate,
    hijriYear,
    hijriMonth,
    hijriDay,
    source,
    region,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_overrides';
  @override
  VerificationContext validateIntegrity(
    Insertable<CalendarOverridesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('gregorian_date')) {
      context.handle(
        _gregorianDateMeta,
        gregorianDate.isAcceptableOrUnknown(
          data['gregorian_date']!,
          _gregorianDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_gregorianDateMeta);
    }
    if (data.containsKey('hijri_year')) {
      context.handle(
        _hijriYearMeta,
        hijriYear.isAcceptableOrUnknown(data['hijri_year']!, _hijriYearMeta),
      );
    } else if (isInserting) {
      context.missing(_hijriYearMeta);
    }
    if (data.containsKey('hijri_month')) {
      context.handle(
        _hijriMonthMeta,
        hijriMonth.isAcceptableOrUnknown(data['hijri_month']!, _hijriMonthMeta),
      );
    } else if (isInserting) {
      context.missing(_hijriMonthMeta);
    }
    if (data.containsKey('hijri_day')) {
      context.handle(
        _hijriDayMeta,
        hijriDay.isAcceptableOrUnknown(data['hijri_day']!, _hijriDayMeta),
      );
    } else if (isInserting) {
      context.missing(_hijriDayMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('region')) {
      context.handle(
        _regionMeta,
        region.isAcceptableOrUnknown(data['region']!, _regionMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarOverridesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarOverridesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gregorianDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gregorian_date'],
      )!,
      hijriYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hijri_year'],
      )!,
      hijriMonth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hijri_month'],
      )!,
      hijriDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hijri_day'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      region: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CalendarOverridesTableTable createAlias(String alias) {
    return $CalendarOverridesTableTable(attachedDatabase, alias);
  }
}

class CalendarOverridesTableData extends DataClass
    implements Insertable<CalendarOverridesTableData> {
  final int id;

  /// Gregorian date being overridden (YYYY-MM-DD).
  final String gregorianDate;

  /// Override Hijri year.
  final int hijriYear;

  /// Override Hijri month (1–12).
  final int hijriMonth;

  /// Override Hijri day (1–30).
  final int hijriDay;

  /// Source: OFFICIAL | REGIONAL | OBSERVED
  final String source;

  /// Optional ISO 3166-1 alpha-2 region code.
  final String? region;

  /// When this override was received/stored (Unix ms).
  final int createdAt;
  const CalendarOverridesTableData({
    required this.id,
    required this.gregorianDate,
    required this.hijriYear,
    required this.hijriMonth,
    required this.hijriDay,
    required this.source,
    this.region,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['gregorian_date'] = Variable<String>(gregorianDate);
    map['hijri_year'] = Variable<int>(hijriYear);
    map['hijri_month'] = Variable<int>(hijriMonth);
    map['hijri_day'] = Variable<int>(hijriDay);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || region != null) {
      map['region'] = Variable<String>(region);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  CalendarOverridesTableCompanion toCompanion(bool nullToAbsent) {
    return CalendarOverridesTableCompanion(
      id: Value(id),
      gregorianDate: Value(gregorianDate),
      hijriYear: Value(hijriYear),
      hijriMonth: Value(hijriMonth),
      hijriDay: Value(hijriDay),
      source: Value(source),
      region: region == null && nullToAbsent
          ? const Value.absent()
          : Value(region),
      createdAt: Value(createdAt),
    );
  }

  factory CalendarOverridesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarOverridesTableData(
      id: serializer.fromJson<int>(json['id']),
      gregorianDate: serializer.fromJson<String>(json['gregorianDate']),
      hijriYear: serializer.fromJson<int>(json['hijriYear']),
      hijriMonth: serializer.fromJson<int>(json['hijriMonth']),
      hijriDay: serializer.fromJson<int>(json['hijriDay']),
      source: serializer.fromJson<String>(json['source']),
      region: serializer.fromJson<String?>(json['region']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gregorianDate': serializer.toJson<String>(gregorianDate),
      'hijriYear': serializer.toJson<int>(hijriYear),
      'hijriMonth': serializer.toJson<int>(hijriMonth),
      'hijriDay': serializer.toJson<int>(hijriDay),
      'source': serializer.toJson<String>(source),
      'region': serializer.toJson<String?>(region),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  CalendarOverridesTableData copyWith({
    int? id,
    String? gregorianDate,
    int? hijriYear,
    int? hijriMonth,
    int? hijriDay,
    String? source,
    Value<String?> region = const Value.absent(),
    int? createdAt,
  }) => CalendarOverridesTableData(
    id: id ?? this.id,
    gregorianDate: gregorianDate ?? this.gregorianDate,
    hijriYear: hijriYear ?? this.hijriYear,
    hijriMonth: hijriMonth ?? this.hijriMonth,
    hijriDay: hijriDay ?? this.hijriDay,
    source: source ?? this.source,
    region: region.present ? region.value : this.region,
    createdAt: createdAt ?? this.createdAt,
  );
  CalendarOverridesTableData copyWithCompanion(
    CalendarOverridesTableCompanion data,
  ) {
    return CalendarOverridesTableData(
      id: data.id.present ? data.id.value : this.id,
      gregorianDate: data.gregorianDate.present
          ? data.gregorianDate.value
          : this.gregorianDate,
      hijriYear: data.hijriYear.present ? data.hijriYear.value : this.hijriYear,
      hijriMonth: data.hijriMonth.present
          ? data.hijriMonth.value
          : this.hijriMonth,
      hijriDay: data.hijriDay.present ? data.hijriDay.value : this.hijriDay,
      source: data.source.present ? data.source.value : this.source,
      region: data.region.present ? data.region.value : this.region,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarOverridesTableData(')
          ..write('id: $id, ')
          ..write('gregorianDate: $gregorianDate, ')
          ..write('hijriYear: $hijriYear, ')
          ..write('hijriMonth: $hijriMonth, ')
          ..write('hijriDay: $hijriDay, ')
          ..write('source: $source, ')
          ..write('region: $region, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    gregorianDate,
    hijriYear,
    hijriMonth,
    hijriDay,
    source,
    region,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarOverridesTableData &&
          other.id == this.id &&
          other.gregorianDate == this.gregorianDate &&
          other.hijriYear == this.hijriYear &&
          other.hijriMonth == this.hijriMonth &&
          other.hijriDay == this.hijriDay &&
          other.source == this.source &&
          other.region == this.region &&
          other.createdAt == this.createdAt);
}

class CalendarOverridesTableCompanion
    extends UpdateCompanion<CalendarOverridesTableData> {
  final Value<int> id;
  final Value<String> gregorianDate;
  final Value<int> hijriYear;
  final Value<int> hijriMonth;
  final Value<int> hijriDay;
  final Value<String> source;
  final Value<String?> region;
  final Value<int> createdAt;
  const CalendarOverridesTableCompanion({
    this.id = const Value.absent(),
    this.gregorianDate = const Value.absent(),
    this.hijriYear = const Value.absent(),
    this.hijriMonth = const Value.absent(),
    this.hijriDay = const Value.absent(),
    this.source = const Value.absent(),
    this.region = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CalendarOverridesTableCompanion.insert({
    this.id = const Value.absent(),
    required String gregorianDate,
    required int hijriYear,
    required int hijriMonth,
    required int hijriDay,
    this.source = const Value.absent(),
    this.region = const Value.absent(),
    required int createdAt,
  }) : gregorianDate = Value(gregorianDate),
       hijriYear = Value(hijriYear),
       hijriMonth = Value(hijriMonth),
       hijriDay = Value(hijriDay),
       createdAt = Value(createdAt);
  static Insertable<CalendarOverridesTableData> custom({
    Expression<int>? id,
    Expression<String>? gregorianDate,
    Expression<int>? hijriYear,
    Expression<int>? hijriMonth,
    Expression<int>? hijriDay,
    Expression<String>? source,
    Expression<String>? region,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gregorianDate != null) 'gregorian_date': gregorianDate,
      if (hijriYear != null) 'hijri_year': hijriYear,
      if (hijriMonth != null) 'hijri_month': hijriMonth,
      if (hijriDay != null) 'hijri_day': hijriDay,
      if (source != null) 'source': source,
      if (region != null) 'region': region,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CalendarOverridesTableCompanion copyWith({
    Value<int>? id,
    Value<String>? gregorianDate,
    Value<int>? hijriYear,
    Value<int>? hijriMonth,
    Value<int>? hijriDay,
    Value<String>? source,
    Value<String?>? region,
    Value<int>? createdAt,
  }) {
    return CalendarOverridesTableCompanion(
      id: id ?? this.id,
      gregorianDate: gregorianDate ?? this.gregorianDate,
      hijriYear: hijriYear ?? this.hijriYear,
      hijriMonth: hijriMonth ?? this.hijriMonth,
      hijriDay: hijriDay ?? this.hijriDay,
      source: source ?? this.source,
      region: region ?? this.region,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gregorianDate.present) {
      map['gregorian_date'] = Variable<String>(gregorianDate.value);
    }
    if (hijriYear.present) {
      map['hijri_year'] = Variable<int>(hijriYear.value);
    }
    if (hijriMonth.present) {
      map['hijri_month'] = Variable<int>(hijriMonth.value);
    }
    if (hijriDay.present) {
      map['hijri_day'] = Variable<int>(hijriDay.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarOverridesTableCompanion(')
          ..write('id: $id, ')
          ..write('gregorianDate: $gregorianDate, ')
          ..write('hijriYear: $hijriYear, ')
          ..write('hijriMonth: $hijriMonth, ')
          ..write('hijriDay: $hijriDay, ')
          ..write('source: $source, ')
          ..write('region: $region, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EventsTableTable eventsTable = $EventsTableTable(this);
  late final $EventRemindersTableTable eventRemindersTable =
      $EventRemindersTableTable(this);
  late final $UserSettingsTableTable userSettingsTable =
      $UserSettingsTableTable(this);
  late final $CalendarSettingsTableTable calendarSettingsTable =
      $CalendarSettingsTableTable(this);
  late final $PrayerSettingsTableTable prayerSettingsTable =
      $PrayerSettingsTableTable(this);
  late final $NotificationSettingsTableTable notificationSettingsTable =
      $NotificationSettingsTableTable(this);
  late final $LocationsTableTable locationsTable = $LocationsTableTable(this);
  late final $CalendarOverridesTableTable calendarOverridesTable =
      $CalendarOverridesTableTable(this);
  late final EventsDao eventsDao = EventsDao(this as AppDatabase);
  late final SettingsDao settingsDao = SettingsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    eventsTable,
    eventRemindersTable,
    userSettingsTable,
    calendarSettingsTable,
    prayerSettingsTable,
    notificationSettingsTable,
    locationsTable,
    calendarOverridesTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('event_reminders', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$EventsTableTableCreateCompanionBuilder =
    EventsTableCompanion Function({
      required String id,
      required String title,
      Value<String?> description,
      Value<String> eventType,
      Value<String> calendarType,
      required String startDate,
      Value<String?> endDate,
      Value<String?> recurrenceJson,
      Value<bool> isActive,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$EventsTableTableUpdateCompanionBuilder =
    EventsTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> description,
      Value<String> eventType,
      Value<String> calendarType,
      Value<String> startDate,
      Value<String?> endDate,
      Value<String?> recurrenceJson,
      Value<bool> isActive,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$EventsTableTableReferences
    extends BaseReferences<_$AppDatabase, $EventsTableTable, EventsTableData> {
  $$EventsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $EventRemindersTableTable,
    List<EventRemindersTableData>
  >
  _eventRemindersTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.eventRemindersTable,
        aliasName: $_aliasNameGenerator(
          db.eventsTable.id,
          db.eventRemindersTable.eventId,
        ),
      );

  $$EventRemindersTableTableProcessedTableManager get eventRemindersTableRefs {
    final manager = $$EventRemindersTableTableTableManager(
      $_db,
      $_db.eventRemindersTable,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _eventRemindersTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EventsTableTableFilterComposer
    extends Composer<_$AppDatabase, $EventsTableTable> {
  $$EventsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calendarType => $composableBuilder(
    column: $table.calendarType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recurrenceJson => $composableBuilder(
    column: $table.recurrenceJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> eventRemindersTableRefs(
    Expression<bool> Function($$EventRemindersTableTableFilterComposer f) f,
  ) {
    final $$EventRemindersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventRemindersTable,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventRemindersTableTableFilterComposer(
            $db: $db,
            $table: $db.eventRemindersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EventsTableTable> {
  $$EventsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calendarType => $composableBuilder(
    column: $table.calendarType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recurrenceJson => $composableBuilder(
    column: $table.recurrenceJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EventsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventsTableTable> {
  $$EventsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

  GeneratedColumn<String> get calendarType => $composableBuilder(
    column: $table.calendarType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<String> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get recurrenceJson => $composableBuilder(
    column: $table.recurrenceJson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> eventRemindersTableRefs<T extends Object>(
    Expression<T> Function($$EventRemindersTableTableAnnotationComposer a) f,
  ) {
    final $$EventRemindersTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.eventRemindersTable,
          getReferencedColumn: (t) => t.eventId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EventRemindersTableTableAnnotationComposer(
                $db: $db,
                $table: $db.eventRemindersTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$EventsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventsTableTable,
          EventsTableData,
          $$EventsTableTableFilterComposer,
          $$EventsTableTableOrderingComposer,
          $$EventsTableTableAnnotationComposer,
          $$EventsTableTableCreateCompanionBuilder,
          $$EventsTableTableUpdateCompanionBuilder,
          (EventsTableData, $$EventsTableTableReferences),
          EventsTableData,
          PrefetchHooks Function({bool eventRemindersTableRefs})
        > {
  $$EventsTableTableTableManager(_$AppDatabase db, $EventsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> eventType = const Value.absent(),
                Value<String> calendarType = const Value.absent(),
                Value<String> startDate = const Value.absent(),
                Value<String?> endDate = const Value.absent(),
                Value<String?> recurrenceJson = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsTableCompanion(
                id: id,
                title: title,
                description: description,
                eventType: eventType,
                calendarType: calendarType,
                startDate: startDate,
                endDate: endDate,
                recurrenceJson: recurrenceJson,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String> eventType = const Value.absent(),
                Value<String> calendarType = const Value.absent(),
                required String startDate,
                Value<String?> endDate = const Value.absent(),
                Value<String?> recurrenceJson = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => EventsTableCompanion.insert(
                id: id,
                title: title,
                description: description,
                eventType: eventType,
                calendarType: calendarType,
                startDate: startDate,
                endDate: endDate,
                recurrenceJson: recurrenceJson,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({eventRemindersTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventRemindersTableRefs) db.eventRemindersTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventRemindersTableRefs)
                    await $_getPrefetchedData<
                      EventsTableData,
                      $EventsTableTable,
                      EventRemindersTableData
                    >(
                      currentTable: table,
                      referencedTable: $$EventsTableTableReferences
                          ._eventRemindersTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$EventsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).eventRemindersTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.eventId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$EventsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventsTableTable,
      EventsTableData,
      $$EventsTableTableFilterComposer,
      $$EventsTableTableOrderingComposer,
      $$EventsTableTableAnnotationComposer,
      $$EventsTableTableCreateCompanionBuilder,
      $$EventsTableTableUpdateCompanionBuilder,
      (EventsTableData, $$EventsTableTableReferences),
      EventsTableData,
      PrefetchHooks Function({bool eventRemindersTableRefs})
    >;
typedef $$EventRemindersTableTableCreateCompanionBuilder =
    EventRemindersTableCompanion Function({
      required String id,
      required String eventId,
      required int minutesBefore,
      required int notificationId,
      Value<bool> isEnabled,
      Value<int> rowid,
    });
typedef $$EventRemindersTableTableUpdateCompanionBuilder =
    EventRemindersTableCompanion Function({
      Value<String> id,
      Value<String> eventId,
      Value<int> minutesBefore,
      Value<int> notificationId,
      Value<bool> isEnabled,
      Value<int> rowid,
    });

final class $$EventRemindersTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $EventRemindersTableTable,
          EventRemindersTableData
        > {
  $$EventRemindersTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EventsTableTable _eventIdTable(_$AppDatabase db) =>
      db.eventsTable.createAlias(
        $_aliasNameGenerator(db.eventRemindersTable.eventId, db.eventsTable.id),
      );

  $$EventsTableTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventsTableTableTableManager(
      $_db,
      $_db.eventsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EventRemindersTableTableFilterComposer
    extends Composer<_$AppDatabase, $EventRemindersTableTable> {
  $$EventRemindersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minutesBefore => $composableBuilder(
    column: $table.minutesBefore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  $$EventsTableTableFilterComposer get eventId {
    final $$EventsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableTableFilterComposer(
            $db: $db,
            $table: $db.eventsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventRemindersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EventRemindersTableTable> {
  $$EventRemindersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minutesBefore => $composableBuilder(
    column: $table.minutesBefore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  $$EventsTableTableOrderingComposer get eventId {
    final $$EventsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableTableOrderingComposer(
            $db: $db,
            $table: $db.eventsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventRemindersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventRemindersTableTable> {
  $$EventRemindersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get minutesBefore => $composableBuilder(
    column: $table.minutesBefore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  $$EventsTableTableAnnotationComposer get eventId {
    final $$EventsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.eventsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventRemindersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventRemindersTableTable,
          EventRemindersTableData,
          $$EventRemindersTableTableFilterComposer,
          $$EventRemindersTableTableOrderingComposer,
          $$EventRemindersTableTableAnnotationComposer,
          $$EventRemindersTableTableCreateCompanionBuilder,
          $$EventRemindersTableTableUpdateCompanionBuilder,
          (EventRemindersTableData, $$EventRemindersTableTableReferences),
          EventRemindersTableData,
          PrefetchHooks Function({bool eventId})
        > {
  $$EventRemindersTableTableTableManager(
    _$AppDatabase db,
    $EventRemindersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventRemindersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventRemindersTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$EventRemindersTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> eventId = const Value.absent(),
                Value<int> minutesBefore = const Value.absent(),
                Value<int> notificationId = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventRemindersTableCompanion(
                id: id,
                eventId: eventId,
                minutesBefore: minutesBefore,
                notificationId: notificationId,
                isEnabled: isEnabled,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String eventId,
                required int minutesBefore,
                required int notificationId,
                Value<bool> isEnabled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventRemindersTableCompanion.insert(
                id: id,
                eventId: eventId,
                minutesBefore: minutesBefore,
                notificationId: notificationId,
                isEnabled: isEnabled,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventRemindersTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({eventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (eventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.eventId,
                                referencedTable:
                                    $$EventRemindersTableTableReferences
                                        ._eventIdTable(db),
                                referencedColumn:
                                    $$EventRemindersTableTableReferences
                                        ._eventIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EventRemindersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventRemindersTableTable,
      EventRemindersTableData,
      $$EventRemindersTableTableFilterComposer,
      $$EventRemindersTableTableOrderingComposer,
      $$EventRemindersTableTableAnnotationComposer,
      $$EventRemindersTableTableCreateCompanionBuilder,
      $$EventRemindersTableTableUpdateCompanionBuilder,
      (EventRemindersTableData, $$EventRemindersTableTableReferences),
      EventRemindersTableData,
      PrefetchHooks Function({bool eventId})
    >;
typedef $$UserSettingsTableTableCreateCompanionBuilder =
    UserSettingsTableCompanion Function({
      Value<int> id,
      Value<String> languageCode,
      Value<String> themeMode,
    });
typedef $$UserSettingsTableTableUpdateCompanionBuilder =
    UserSettingsTableCompanion Function({
      Value<int> id,
      Value<String> languageCode,
      Value<String> themeMode,
    });

class $$UserSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserSettingsTableTable> {
  $$UserSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserSettingsTableTable> {
  $$UserSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserSettingsTableTable> {
  $$UserSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);
}

class $$UserSettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserSettingsTableTable,
          UserSettingsTableData,
          $$UserSettingsTableTableFilterComposer,
          $$UserSettingsTableTableOrderingComposer,
          $$UserSettingsTableTableAnnotationComposer,
          $$UserSettingsTableTableCreateCompanionBuilder,
          $$UserSettingsTableTableUpdateCompanionBuilder,
          (
            UserSettingsTableData,
            BaseReferences<
              _$AppDatabase,
              $UserSettingsTableTable,
              UserSettingsTableData
            >,
          ),
          UserSettingsTableData,
          PrefetchHooks Function()
        > {
  $$UserSettingsTableTableTableManager(
    _$AppDatabase db,
    $UserSettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserSettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserSettingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> languageCode = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
              }) => UserSettingsTableCompanion(
                id: id,
                languageCode: languageCode,
                themeMode: themeMode,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> languageCode = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
              }) => UserSettingsTableCompanion.insert(
                id: id,
                languageCode: languageCode,
                themeMode: themeMode,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserSettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserSettingsTableTable,
      UserSettingsTableData,
      $$UserSettingsTableTableFilterComposer,
      $$UserSettingsTableTableOrderingComposer,
      $$UserSettingsTableTableAnnotationComposer,
      $$UserSettingsTableTableCreateCompanionBuilder,
      $$UserSettingsTableTableUpdateCompanionBuilder,
      (
        UserSettingsTableData,
        BaseReferences<
          _$AppDatabase,
          $UserSettingsTableTable,
          UserSettingsTableData
        >,
      ),
      UserSettingsTableData,
      PrefetchHooks Function()
    >;
typedef $$CalendarSettingsTableTableCreateCompanionBuilder =
    CalendarSettingsTableCompanion Function({
      Value<int> id,
      Value<String> hijriMethod,
      Value<int> hijriAdjustment,
      Value<String> primaryCalendar,
    });
typedef $$CalendarSettingsTableTableUpdateCompanionBuilder =
    CalendarSettingsTableCompanion Function({
      Value<int> id,
      Value<String> hijriMethod,
      Value<int> hijriAdjustment,
      Value<String> primaryCalendar,
    });

class $$CalendarSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CalendarSettingsTableTable> {
  $$CalendarSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hijriMethod => $composableBuilder(
    column: $table.hijriMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hijriAdjustment => $composableBuilder(
    column: $table.hijriAdjustment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get primaryCalendar => $composableBuilder(
    column: $table.primaryCalendar,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CalendarSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CalendarSettingsTableTable> {
  $$CalendarSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hijriMethod => $composableBuilder(
    column: $table.hijriMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hijriAdjustment => $composableBuilder(
    column: $table.hijriAdjustment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get primaryCalendar => $composableBuilder(
    column: $table.primaryCalendar,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CalendarSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalendarSettingsTableTable> {
  $$CalendarSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get hijriMethod => $composableBuilder(
    column: $table.hijriMethod,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hijriAdjustment => $composableBuilder(
    column: $table.hijriAdjustment,
    builder: (column) => column,
  );

  GeneratedColumn<String> get primaryCalendar => $composableBuilder(
    column: $table.primaryCalendar,
    builder: (column) => column,
  );
}

class $$CalendarSettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CalendarSettingsTableTable,
          CalendarSettingsTableData,
          $$CalendarSettingsTableTableFilterComposer,
          $$CalendarSettingsTableTableOrderingComposer,
          $$CalendarSettingsTableTableAnnotationComposer,
          $$CalendarSettingsTableTableCreateCompanionBuilder,
          $$CalendarSettingsTableTableUpdateCompanionBuilder,
          (
            CalendarSettingsTableData,
            BaseReferences<
              _$AppDatabase,
              $CalendarSettingsTableTable,
              CalendarSettingsTableData
            >,
          ),
          CalendarSettingsTableData,
          PrefetchHooks Function()
        > {
  $$CalendarSettingsTableTableTableManager(
    _$AppDatabase db,
    $CalendarSettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarSettingsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CalendarSettingsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CalendarSettingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> hijriMethod = const Value.absent(),
                Value<int> hijriAdjustment = const Value.absent(),
                Value<String> primaryCalendar = const Value.absent(),
              }) => CalendarSettingsTableCompanion(
                id: id,
                hijriMethod: hijriMethod,
                hijriAdjustment: hijriAdjustment,
                primaryCalendar: primaryCalendar,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> hijriMethod = const Value.absent(),
                Value<int> hijriAdjustment = const Value.absent(),
                Value<String> primaryCalendar = const Value.absent(),
              }) => CalendarSettingsTableCompanion.insert(
                id: id,
                hijriMethod: hijriMethod,
                hijriAdjustment: hijriAdjustment,
                primaryCalendar: primaryCalendar,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CalendarSettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CalendarSettingsTableTable,
      CalendarSettingsTableData,
      $$CalendarSettingsTableTableFilterComposer,
      $$CalendarSettingsTableTableOrderingComposer,
      $$CalendarSettingsTableTableAnnotationComposer,
      $$CalendarSettingsTableTableCreateCompanionBuilder,
      $$CalendarSettingsTableTableUpdateCompanionBuilder,
      (
        CalendarSettingsTableData,
        BaseReferences<
          _$AppDatabase,
          $CalendarSettingsTableTable,
          CalendarSettingsTableData
        >,
      ),
      CalendarSettingsTableData,
      PrefetchHooks Function()
    >;
typedef $$PrayerSettingsTableTableCreateCompanionBuilder =
    PrayerSettingsTableCompanion Function({
      Value<int> id,
      Value<String> calculationMethod,
      Value<String> asrMethod,
      Value<String> highLatitudeRule,
      Value<bool> enabled,
    });
typedef $$PrayerSettingsTableTableUpdateCompanionBuilder =
    PrayerSettingsTableCompanion Function({
      Value<int> id,
      Value<String> calculationMethod,
      Value<String> asrMethod,
      Value<String> highLatitudeRule,
      Value<bool> enabled,
    });

class $$PrayerSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PrayerSettingsTableTable> {
  $$PrayerSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calculationMethod => $composableBuilder(
    column: $table.calculationMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get asrMethod => $composableBuilder(
    column: $table.asrMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get highLatitudeRule => $composableBuilder(
    column: $table.highLatitudeRule,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PrayerSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayerSettingsTableTable> {
  $$PrayerSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calculationMethod => $composableBuilder(
    column: $table.calculationMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get asrMethod => $composableBuilder(
    column: $table.asrMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get highLatitudeRule => $composableBuilder(
    column: $table.highLatitudeRule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrayerSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayerSettingsTableTable> {
  $$PrayerSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get calculationMethod => $composableBuilder(
    column: $table.calculationMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get asrMethod =>
      $composableBuilder(column: $table.asrMethod, builder: (column) => column);

  GeneratedColumn<String> get highLatitudeRule => $composableBuilder(
    column: $table.highLatitudeRule,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);
}

class $$PrayerSettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrayerSettingsTableTable,
          PrayerSettingsTableData,
          $$PrayerSettingsTableTableFilterComposer,
          $$PrayerSettingsTableTableOrderingComposer,
          $$PrayerSettingsTableTableAnnotationComposer,
          $$PrayerSettingsTableTableCreateCompanionBuilder,
          $$PrayerSettingsTableTableUpdateCompanionBuilder,
          (
            PrayerSettingsTableData,
            BaseReferences<
              _$AppDatabase,
              $PrayerSettingsTableTable,
              PrayerSettingsTableData
            >,
          ),
          PrayerSettingsTableData,
          PrefetchHooks Function()
        > {
  $$PrayerSettingsTableTableTableManager(
    _$AppDatabase db,
    $PrayerSettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrayerSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrayerSettingsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PrayerSettingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> calculationMethod = const Value.absent(),
                Value<String> asrMethod = const Value.absent(),
                Value<String> highLatitudeRule = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
              }) => PrayerSettingsTableCompanion(
                id: id,
                calculationMethod: calculationMethod,
                asrMethod: asrMethod,
                highLatitudeRule: highLatitudeRule,
                enabled: enabled,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> calculationMethod = const Value.absent(),
                Value<String> asrMethod = const Value.absent(),
                Value<String> highLatitudeRule = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
              }) => PrayerSettingsTableCompanion.insert(
                id: id,
                calculationMethod: calculationMethod,
                asrMethod: asrMethod,
                highLatitudeRule: highLatitudeRule,
                enabled: enabled,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PrayerSettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrayerSettingsTableTable,
      PrayerSettingsTableData,
      $$PrayerSettingsTableTableFilterComposer,
      $$PrayerSettingsTableTableOrderingComposer,
      $$PrayerSettingsTableTableAnnotationComposer,
      $$PrayerSettingsTableTableCreateCompanionBuilder,
      $$PrayerSettingsTableTableUpdateCompanionBuilder,
      (
        PrayerSettingsTableData,
        BaseReferences<
          _$AppDatabase,
          $PrayerSettingsTableTable,
          PrayerSettingsTableData
        >,
      ),
      PrayerSettingsTableData,
      PrefetchHooks Function()
    >;
typedef $$NotificationSettingsTableTableCreateCompanionBuilder =
    NotificationSettingsTableCompanion Function({
      Value<int> id,
      Value<bool> eventReminders,
      Value<bool> islamicEventReminders,
      Value<bool> dailyReminder,
      Value<bool> prayerReminders,
      Value<String> dailyReminderTime,
    });
typedef $$NotificationSettingsTableTableUpdateCompanionBuilder =
    NotificationSettingsTableCompanion Function({
      Value<int> id,
      Value<bool> eventReminders,
      Value<bool> islamicEventReminders,
      Value<bool> dailyReminder,
      Value<bool> prayerReminders,
      Value<String> dailyReminderTime,
    });

class $$NotificationSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationSettingsTableTable> {
  $$NotificationSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get eventReminders => $composableBuilder(
    column: $table.eventReminders,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get islamicEventReminders => $composableBuilder(
    column: $table.islamicEventReminders,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get dailyReminder => $composableBuilder(
    column: $table.dailyReminder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get prayerReminders => $composableBuilder(
    column: $table.prayerReminders,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dailyReminderTime => $composableBuilder(
    column: $table.dailyReminderTime,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotificationSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationSettingsTableTable> {
  $$NotificationSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get eventReminders => $composableBuilder(
    column: $table.eventReminders,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get islamicEventReminders => $composableBuilder(
    column: $table.islamicEventReminders,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get dailyReminder => $composableBuilder(
    column: $table.dailyReminder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get prayerReminders => $composableBuilder(
    column: $table.prayerReminders,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dailyReminderTime => $composableBuilder(
    column: $table.dailyReminderTime,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotificationSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationSettingsTableTable> {
  $$NotificationSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get eventReminders => $composableBuilder(
    column: $table.eventReminders,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get islamicEventReminders => $composableBuilder(
    column: $table.islamicEventReminders,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get dailyReminder => $composableBuilder(
    column: $table.dailyReminder,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get prayerReminders => $composableBuilder(
    column: $table.prayerReminders,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dailyReminderTime => $composableBuilder(
    column: $table.dailyReminderTime,
    builder: (column) => column,
  );
}

class $$NotificationSettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationSettingsTableTable,
          NotificationSettingsTableData,
          $$NotificationSettingsTableTableFilterComposer,
          $$NotificationSettingsTableTableOrderingComposer,
          $$NotificationSettingsTableTableAnnotationComposer,
          $$NotificationSettingsTableTableCreateCompanionBuilder,
          $$NotificationSettingsTableTableUpdateCompanionBuilder,
          (
            NotificationSettingsTableData,
            BaseReferences<
              _$AppDatabase,
              $NotificationSettingsTableTable,
              NotificationSettingsTableData
            >,
          ),
          NotificationSettingsTableData,
          PrefetchHooks Function()
        > {
  $$NotificationSettingsTableTableTableManager(
    _$AppDatabase db,
    $NotificationSettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationSettingsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$NotificationSettingsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$NotificationSettingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> eventReminders = const Value.absent(),
                Value<bool> islamicEventReminders = const Value.absent(),
                Value<bool> dailyReminder = const Value.absent(),
                Value<bool> prayerReminders = const Value.absent(),
                Value<String> dailyReminderTime = const Value.absent(),
              }) => NotificationSettingsTableCompanion(
                id: id,
                eventReminders: eventReminders,
                islamicEventReminders: islamicEventReminders,
                dailyReminder: dailyReminder,
                prayerReminders: prayerReminders,
                dailyReminderTime: dailyReminderTime,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> eventReminders = const Value.absent(),
                Value<bool> islamicEventReminders = const Value.absent(),
                Value<bool> dailyReminder = const Value.absent(),
                Value<bool> prayerReminders = const Value.absent(),
                Value<String> dailyReminderTime = const Value.absent(),
              }) => NotificationSettingsTableCompanion.insert(
                id: id,
                eventReminders: eventReminders,
                islamicEventReminders: islamicEventReminders,
                dailyReminder: dailyReminder,
                prayerReminders: prayerReminders,
                dailyReminderTime: dailyReminderTime,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationSettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationSettingsTableTable,
      NotificationSettingsTableData,
      $$NotificationSettingsTableTableFilterComposer,
      $$NotificationSettingsTableTableOrderingComposer,
      $$NotificationSettingsTableTableAnnotationComposer,
      $$NotificationSettingsTableTableCreateCompanionBuilder,
      $$NotificationSettingsTableTableUpdateCompanionBuilder,
      (
        NotificationSettingsTableData,
        BaseReferences<
          _$AppDatabase,
          $NotificationSettingsTableTable,
          NotificationSettingsTableData
        >,
      ),
      NotificationSettingsTableData,
      PrefetchHooks Function()
    >;
typedef $$LocationsTableTableCreateCompanionBuilder =
    LocationsTableCompanion Function({
      Value<int> id,
      required double latitude,
      required double longitude,
      required String timezone,
      required String city,
      required String country,
      Value<String> source,
      required int updatedAt,
    });
typedef $$LocationsTableTableUpdateCompanionBuilder =
    LocationsTableCompanion Function({
      Value<int> id,
      Value<double> latitude,
      Value<double> longitude,
      Value<String> timezone,
      Value<String> city,
      Value<String> country,
      Value<String> source,
      Value<int> updatedAt,
    });

class $$LocationsTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocationsTableTable> {
  $$LocationsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocationsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationsTableTable> {
  $$LocationsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocationsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationsTableTable> {
  $$LocationsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LocationsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocationsTableTable,
          LocationsTableData,
          $$LocationsTableTableFilterComposer,
          $$LocationsTableTableOrderingComposer,
          $$LocationsTableTableAnnotationComposer,
          $$LocationsTableTableCreateCompanionBuilder,
          $$LocationsTableTableUpdateCompanionBuilder,
          (
            LocationsTableData,
            BaseReferences<
              _$AppDatabase,
              $LocationsTableTable,
              LocationsTableData
            >,
          ),
          LocationsTableData,
          PrefetchHooks Function()
        > {
  $$LocationsTableTableTableManager(
    _$AppDatabase db,
    $LocationsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<String> timezone = const Value.absent(),
                Value<String> city = const Value.absent(),
                Value<String> country = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
              }) => LocationsTableCompanion(
                id: id,
                latitude: latitude,
                longitude: longitude,
                timezone: timezone,
                city: city,
                country: country,
                source: source,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double latitude,
                required double longitude,
                required String timezone,
                required String city,
                required String country,
                Value<String> source = const Value.absent(),
                required int updatedAt,
              }) => LocationsTableCompanion.insert(
                id: id,
                latitude: latitude,
                longitude: longitude,
                timezone: timezone,
                city: city,
                country: country,
                source: source,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocationsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocationsTableTable,
      LocationsTableData,
      $$LocationsTableTableFilterComposer,
      $$LocationsTableTableOrderingComposer,
      $$LocationsTableTableAnnotationComposer,
      $$LocationsTableTableCreateCompanionBuilder,
      $$LocationsTableTableUpdateCompanionBuilder,
      (
        LocationsTableData,
        BaseReferences<_$AppDatabase, $LocationsTableTable, LocationsTableData>,
      ),
      LocationsTableData,
      PrefetchHooks Function()
    >;
typedef $$CalendarOverridesTableTableCreateCompanionBuilder =
    CalendarOverridesTableCompanion Function({
      Value<int> id,
      required String gregorianDate,
      required int hijriYear,
      required int hijriMonth,
      required int hijriDay,
      Value<String> source,
      Value<String?> region,
      required int createdAt,
    });
typedef $$CalendarOverridesTableTableUpdateCompanionBuilder =
    CalendarOverridesTableCompanion Function({
      Value<int> id,
      Value<String> gregorianDate,
      Value<int> hijriYear,
      Value<int> hijriMonth,
      Value<int> hijriDay,
      Value<String> source,
      Value<String?> region,
      Value<int> createdAt,
    });

class $$CalendarOverridesTableTableFilterComposer
    extends Composer<_$AppDatabase, $CalendarOverridesTableTable> {
  $$CalendarOverridesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gregorianDate => $composableBuilder(
    column: $table.gregorianDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hijriYear => $composableBuilder(
    column: $table.hijriYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hijriMonth => $composableBuilder(
    column: $table.hijriMonth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hijriDay => $composableBuilder(
    column: $table.hijriDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CalendarOverridesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CalendarOverridesTableTable> {
  $$CalendarOverridesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gregorianDate => $composableBuilder(
    column: $table.gregorianDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hijriYear => $composableBuilder(
    column: $table.hijriYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hijriMonth => $composableBuilder(
    column: $table.hijriMonth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hijriDay => $composableBuilder(
    column: $table.hijriDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CalendarOverridesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalendarOverridesTableTable> {
  $$CalendarOverridesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get gregorianDate => $composableBuilder(
    column: $table.gregorianDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hijriYear =>
      $composableBuilder(column: $table.hijriYear, builder: (column) => column);

  GeneratedColumn<int> get hijriMonth => $composableBuilder(
    column: $table.hijriMonth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hijriDay =>
      $composableBuilder(column: $table.hijriDay, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get region =>
      $composableBuilder(column: $table.region, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CalendarOverridesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CalendarOverridesTableTable,
          CalendarOverridesTableData,
          $$CalendarOverridesTableTableFilterComposer,
          $$CalendarOverridesTableTableOrderingComposer,
          $$CalendarOverridesTableTableAnnotationComposer,
          $$CalendarOverridesTableTableCreateCompanionBuilder,
          $$CalendarOverridesTableTableUpdateCompanionBuilder,
          (
            CalendarOverridesTableData,
            BaseReferences<
              _$AppDatabase,
              $CalendarOverridesTableTable,
              CalendarOverridesTableData
            >,
          ),
          CalendarOverridesTableData,
          PrefetchHooks Function()
        > {
  $$CalendarOverridesTableTableTableManager(
    _$AppDatabase db,
    $CalendarOverridesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarOverridesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CalendarOverridesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CalendarOverridesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> gregorianDate = const Value.absent(),
                Value<int> hijriYear = const Value.absent(),
                Value<int> hijriMonth = const Value.absent(),
                Value<int> hijriDay = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> region = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => CalendarOverridesTableCompanion(
                id: id,
                gregorianDate: gregorianDate,
                hijriYear: hijriYear,
                hijriMonth: hijriMonth,
                hijriDay: hijriDay,
                source: source,
                region: region,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String gregorianDate,
                required int hijriYear,
                required int hijriMonth,
                required int hijriDay,
                Value<String> source = const Value.absent(),
                Value<String?> region = const Value.absent(),
                required int createdAt,
              }) => CalendarOverridesTableCompanion.insert(
                id: id,
                gregorianDate: gregorianDate,
                hijriYear: hijriYear,
                hijriMonth: hijriMonth,
                hijriDay: hijriDay,
                source: source,
                region: region,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CalendarOverridesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CalendarOverridesTableTable,
      CalendarOverridesTableData,
      $$CalendarOverridesTableTableFilterComposer,
      $$CalendarOverridesTableTableOrderingComposer,
      $$CalendarOverridesTableTableAnnotationComposer,
      $$CalendarOverridesTableTableCreateCompanionBuilder,
      $$CalendarOverridesTableTableUpdateCompanionBuilder,
      (
        CalendarOverridesTableData,
        BaseReferences<
          _$AppDatabase,
          $CalendarOverridesTableTable,
          CalendarOverridesTableData
        >,
      ),
      CalendarOverridesTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EventsTableTableTableManager get eventsTable =>
      $$EventsTableTableTableManager(_db, _db.eventsTable);
  $$EventRemindersTableTableTableManager get eventRemindersTable =>
      $$EventRemindersTableTableTableManager(_db, _db.eventRemindersTable);
  $$UserSettingsTableTableTableManager get userSettingsTable =>
      $$UserSettingsTableTableTableManager(_db, _db.userSettingsTable);
  $$CalendarSettingsTableTableTableManager get calendarSettingsTable =>
      $$CalendarSettingsTableTableTableManager(_db, _db.calendarSettingsTable);
  $$PrayerSettingsTableTableTableManager get prayerSettingsTable =>
      $$PrayerSettingsTableTableTableManager(_db, _db.prayerSettingsTable);
  $$NotificationSettingsTableTableTableManager get notificationSettingsTable =>
      $$NotificationSettingsTableTableTableManager(
        _db,
        _db.notificationSettingsTable,
      );
  $$LocationsTableTableTableManager get locationsTable =>
      $$LocationsTableTableTableManager(_db, _db.locationsTable);
  $$CalendarOverridesTableTableTableManager get calendarOverridesTable =>
      $$CalendarOverridesTableTableTableManager(
        _db,
        _db.calendarOverridesTable,
      );
}
