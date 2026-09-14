/// Screen for creating and editing personal events with Gregorian/Hijri date selection.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../../calendar_engine/calendar_engine.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../localization/generated/app_localizations.dart';
import '../application/events_controller.dart';
import '../domain/personal_event.dart';
import '../domain/recurrence.dart';

class CreateEditEventScreen extends ConsumerStatefulWidget {
  const CreateEditEventScreen({
    this.existingEvent,
    this.initialDate,
    super.key,
  });

  /// The event being edited (null if creating a new event).
  final PersonalEvent? existingEvent;

  /// Optional initial date when creating from day view.
  final CalendarDate? initialDate;

  @override
  ConsumerState<CreateEditEventScreen> createState() =>
      _CreateEditEventScreenState();
}

class _CreateEditEventScreenState extends ConsumerState<CreateEditEventScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  late EventCalendarType _calendarType;
  late DateTime _selectedGregorianDate;
  late HijriDate _selectedHijriDate;
  late TimeOfDay _selectedTime;
  late bool _isAllDay;
  late RecurrenceFrequency _recurrenceFreq;
  int? _reminderMinutes;
  int? _selectedColor;

  static const _engine = UmmAlQuraEngine();

  @override
  void initState() {
    super.initState();

    final ev = widget.existingEvent;
    if (ev != null) {
      _titleController = TextEditingController(text: ev.title);
      _descriptionController = TextEditingController(text: ev.description ?? '');
      _calendarType = ev.calendarType;
      _selectedGregorianDate = ev.startDate;
      final g = GregorianDate(ev.startDate.year, ev.startDate.month, ev.startDate.day);
      _selectedHijriDate = _engine.fromGregorian(g);
      _selectedTime = TimeOfDay.fromDateTime(ev.startDate);
      _isAllDay = ev.isAllDay;
      _recurrenceFreq = ev.recurrence.frequency;
      _reminderMinutes = ev.reminderMinutes;
      _selectedColor = ev.colorValue;
    } else {
      final now = DateTime.now();
      _titleController = TextEditingController();
      _descriptionController = TextEditingController();
      _calendarType = EventCalendarType.gregorian;

      if (widget.initialDate != null) {
        final g = widget.initialDate!.gregorian;
        _selectedGregorianDate = DateTime(g.year, g.month, g.day, now.hour);
        _selectedHijriDate = widget.initialDate!.hijri;
      } else {
        _selectedGregorianDate = DateTime(now.year, now.month, now.day, now.hour + 1);
        final g = GregorianDate(now.year, now.month, now.day);
        _selectedHijriDate = _engine.fromGregorian(g);
      }

      _selectedTime = TimeOfDay.fromDateTime(_selectedGregorianDate);
      _isAllDay = true;
      _recurrenceFreq = RecurrenceFrequency.none;
      _reminderMinutes = 15; // default 15m reminder
      _selectedColor = kColorPersonalEvent.toARGB32();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _syncHijriFromGregorian(DateTime dt) {
    final g = GregorianDate(dt.year, dt.month, dt.day);
    setState(() {
      _selectedGregorianDate = dt;
      _selectedHijriDate = _engine.fromGregorian(g);
    });
  }

  void _syncGregorianFromHijri(HijriDate h) {
    final g = _engine.toGregorian(h);
    final dt = DateTime(
      g.year,
      g.month,
      g.day,
      _selectedGregorianDate.hour,
      _selectedGregorianDate.minute,
    );
    setState(() {
      _selectedHijriDate = h;
      _selectedGregorianDate = dt;
    });
  }

  Future<void> _pickGregorianDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedGregorianDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      _syncHijriFromGregorian(
        DateTime(
          picked.year,
          picked.month,
          picked.day,
          _selectedGregorianDate.hour,
          _selectedGregorianDate.minute,
        ),
      );
    }
  }

  Future<void> _pickHijriDate() async {
    final l10n = AppLocalizations.of(context);
    final monthNames = [
      l10n?.hijriMonthMuharram ?? 'Muharram',
      l10n?.hijriMonthSafar ?? 'Safar',
      l10n?.hijriMonthRabiAlAwwal ?? "Rabi' al-Awwal",
      l10n?.hijriMonthRabiAlThani ?? "Rabi' al-Thani",
      l10n?.hijriMonthJumadaAlUla ?? 'Jumada al-Ula',
      l10n?.hijriMonthJumadaAlAkhira ?? 'Jumada al-Akhira',
      l10n?.hijriMonthRajab ?? 'Rajab',
      l10n?.hijriMonthShaban ?? "Sha'ban",
      l10n?.hijriMonthRamadan ?? 'Ramadan',
      l10n?.hijriMonthShawwal ?? 'Shawwal',
      l10n?.hijriMonthDhulQadah ?? "Dhul-Qa'dah",
      l10n?.hijriMonthDhulHijja ?? 'Dhul-Hijja',
    ];

    var pickedYear = _selectedHijriDate.year;
    var pickedMonth = _selectedHijriDate.month;
    var pickedDay = _selectedHijriDate.day;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogCtx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(l10n?.eventsDate ?? 'Select Hijri Date'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Year selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Year:'),
                  DropdownButton<int>(
                    value: pickedYear,
                    items: List.generate(
                      20,
                      (i) => DropdownMenuItem(
                        value: 1440 + i,
                        child: Text('${1440 + i} ${l10n?.ahSuffix ?? 'AH'}'),
                      ),
                    ),
                    onChanged: (y) {
                      if (y != null) setDialogState(() => pickedYear = y);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Month selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Month:'),
                  DropdownButton<int>(
                    value: pickedMonth,
                    items: List.generate(
                      12,
                      (i) => DropdownMenuItem(
                        value: i + 1,
                        child: Text(monthNames[i]),
                      ),
                    ),
                    onChanged: (m) {
                      if (m != null) setDialogState(() => pickedMonth = m);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Day selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Day:'),
                  DropdownButton<int>(
                    value: pickedDay.clamp(1, 30),
                    items: List.generate(
                      30,
                      (i) => DropdownMenuItem(
                        value: i + 1,
                        child: Text('${i + 1}'),
                      ),
                    ),
                    onChanged: (d) {
                      if (d != null) setDialogState(() => pickedDay = d);
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogCtx).pop(false),
              child: Text(l10n?.eventsCancel ?? 'Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogCtx).pop(true),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );

    if (confirmed ?? false) {
      _syncGregorianFromHijri(
        HijriDate(
          year: pickedYear,
          month: pickedMonth,
          day: pickedDay,
        ),
      );
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final now = DateTime.now();
    final eventId = widget.existingEvent?.id ?? const Uuid().v4();

    DateTime startDateTime;
    if (_isAllDay) {
      startDateTime = DateTime(
        _selectedGregorianDate.year,
        _selectedGregorianDate.month,
        _selectedGregorianDate.day,
      );
    } else {
      startDateTime = DateTime(
        _selectedGregorianDate.year,
        _selectedGregorianDate.month,
        _selectedGregorianDate.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );
    }

    final recurrence = EventRecurrence(
      frequency: _recurrenceFreq,
      hijriMonth: _calendarType == EventCalendarType.hijri ? _selectedHijriDate.month : null,
      hijriDay: _calendarType == EventCalendarType.hijri ? _selectedHijriDate.day : null,
    );

    final event = PersonalEvent(
      id: eventId,
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      calendarType: _calendarType,
      startDate: startDateTime,
      isAllDay: _isAllDay,
      recurrence: recurrence,
      reminderMinutes: _reminderMinutes,
      colorValue: _selectedColor,
      createdAt: widget.existingEvent?.createdAt ?? now,
      updatedAt: now,
    );

    await ref.read(eventsNotifierProvider.notifier).saveEvent(event);

    if (mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final isEditing = widget.existingEvent != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing
            ? (l10n?.eventsEditEvent ?? 'Edit Event')
            : (l10n?.eventsCreateEvent ?? 'New Event')),
        actions: [
          TextButton(
            onPressed: _save,
            child: Text(
              l10n?.eventsSave ?? 'Save',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Title input
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: l10n?.eventsTitle ?? 'Title',
                hintText: 'e.g. Family Gathering or Fasting Ayyam al-Beed',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.title),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return l10n?.eventsTitleRequired ?? 'Title is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Description input
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: l10n?.eventsDescription ?? 'Description (optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.notes),
              ),
            ),
            const SizedBox(height: 20),

            // Calendar System selector (Gregorian vs Hijri)
            Text(
              l10n?.eventsCalendarType ?? 'Calendar System',
              style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SegmentedButton<EventCalendarType>(
              segments: [
                ButtonSegment(
                  value: EventCalendarType.gregorian,
                  label: Text(l10n?.eventsGregorian ?? 'Gregorian'),
                  icon: const Icon(Icons.calendar_today_outlined),
                ),
                ButtonSegment(
                  value: EventCalendarType.hijri,
                  label: Text(l10n?.eventsHijri ?? 'Hijri'),
                  icon: const Icon(Icons.nights_stay_outlined),
                ),
              ],
              selected: {_calendarType},
              onSelectionChanged: (set) {
                setState(() => _calendarType = set.first);
              },
            ),
            const SizedBox(height: 20),

            // Date Selection Card
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: theme.colorScheme.outlineVariant),
              ),
              child: ListTile(
                leading: Icon(
                  _calendarType == EventCalendarType.hijri
                      ? Icons.nights_stay
                      : Icons.calendar_month,
                  color: theme.colorScheme.primary,
                ),
                title: Text(
                  _calendarType == EventCalendarType.hijri
                      ? _selectedHijriDate.formatEn()
                      : DateFormatter.formatFullDate(_selectedGregorianDate),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  _calendarType == EventCalendarType.hijri
                      ? 'Equivalent: ${DateFormatter.formatFullDate(_selectedGregorianDate)}'
                      : 'Hijri: ${_selectedHijriDate.formatEn()}',
                ),
                trailing: const Icon(Icons.edit_calendar),
                onTap: _calendarType == EventCalendarType.hijri
                    ? _pickHijriDate
                    : _pickGregorianDate,
              ),
            ),
            const SizedBox(height: 12),

            // All Day switch
            SwitchListTile(
              title: Text(l10n?.eventsAllDay ?? 'All Day'),
              value: _isAllDay,
              onChanged: (val) => setState(() => _isAllDay = val),
            ),

            if (!_isAllDay) ...[
              ListTile(
                leading: const Icon(Icons.access_time),
                title: Text(l10n?.eventsTime ?? 'Time'),
                trailing: Text(
                  _selectedTime.format(context),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: _selectedTime,
                  );
                  if (picked != null) {
                    setState(() => _selectedTime = picked);
                  }
                },
              ),
            ],

            const Divider(height: 32),

            // Recurrence selection
            ListTile(
              leading: const Icon(Icons.repeat),
              title: Text(l10n?.eventsRecurrence ?? 'Repeat'),
              trailing: DropdownButton<RecurrenceFrequency>(
                value: _recurrenceFreq,
                underline: const SizedBox.shrink(),
                items: [
                  DropdownMenuItem(
                    value: RecurrenceFrequency.none,
                    child: Text(l10n?.eventsRecurrenceNone ?? 'Does not repeat'),
                  ),
                  DropdownMenuItem(
                    value: RecurrenceFrequency.daily,
                    child: Text(l10n?.eventsRecurrenceDaily ?? 'Daily'),
                  ),
                  DropdownMenuItem(
                    value: RecurrenceFrequency.weekly,
                    child: Text(l10n?.eventsRecurrenceWeekly ?? 'Weekly'),
                  ),
                  DropdownMenuItem(
                    value: RecurrenceFrequency.monthly,
                    child: Text(l10n?.eventsRecurrenceMonthly ?? 'Monthly'),
                  ),
                  DropdownMenuItem(
                    value: RecurrenceFrequency.yearly,
                    child: Text(l10n?.eventsRecurrenceYearly ?? 'Yearly'),
                  ),
                ],
                onChanged: (freq) {
                  if (freq != null) setState(() => _recurrenceFreq = freq);
                },
              ),
            ),

            // Reminder selection
            ListTile(
              leading: const Icon(Icons.notifications_active_outlined),
              title: Text(l10n?.eventsReminder ?? 'Reminder'),
              trailing: DropdownButton<int?>(
                value: _reminderMinutes,
                underline: const SizedBox.shrink(),
                items: [
                  DropdownMenuItem(
                    child: Text(l10n?.eventsReminderNone ?? 'No reminder'),
                  ),
                  DropdownMenuItem(
                    value: 0,
                    child: Text(l10n?.eventsReminderAtTime ?? 'At time of event'),
                  ),
                  DropdownMenuItem(
                    value: 15,
                    child: Text(l10n?.eventsReminder15Min ?? '15 minutes before'),
                  ),
                  DropdownMenuItem(
                    value: 30,
                    child: Text(l10n?.eventsReminder30Min ?? '30 minutes before'),
                  ),
                  DropdownMenuItem(
                    value: 60,
                    child: Text(l10n?.eventsReminder1Hour ?? '1 hour before'),
                  ),
                  DropdownMenuItem(
                    value: 1440,
                    child: Text(l10n?.eventsReminder1Day ?? '1 day before'),
                  ),
                ],
                onChanged: (rem) {
                  setState(() => _reminderMinutes = rem);
                },
              ),
            ),

            const SizedBox(height: 24),

            // Action buttons
            FilledButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.check),
              label: Text(
                isEditing
                    ? (l10n?.eventsSave ?? 'Save Event')
                    : (l10n?.eventsCreateEvent ?? 'Create Event'),
              ),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
