import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'Mīzān Calendar'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get navCalendar;

  /// No description provided for @navEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get navEvents;

  /// No description provided for @navPrayer.
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get navPrayer;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get greetingEvening;

  /// No description provided for @greetingNight.
  ///
  /// In en, this message translates to:
  /// **'Good night'**
  String get greetingNight;

  /// No description provided for @todayLabel.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayLabel;

  /// No description provided for @goToToday.
  ///
  /// In en, this message translates to:
  /// **'Go to Today'**
  String get goToToday;

  /// No description provided for @calendarSystemGregorian.
  ///
  /// In en, this message translates to:
  /// **'Gregorian'**
  String get calendarSystemGregorian;

  /// No description provided for @calendarSystemHijri.
  ///
  /// In en, this message translates to:
  /// **'Hijri'**
  String get calendarSystemHijri;

  /// No description provided for @calendarSystemDual.
  ///
  /// In en, this message translates to:
  /// **'Dual'**
  String get calendarSystemDual;

  /// No description provided for @nextPrayer.
  ///
  /// In en, this message translates to:
  /// **'Next Prayer'**
  String get nextPrayer;

  /// No description provided for @upcomingEvents.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcomingEvents;

  /// No description provided for @noUpcomingEvents.
  ///
  /// In en, this message translates to:
  /// **'No upcoming events'**
  String get noUpcomingEvents;

  /// No description provided for @prayerFajr.
  ///
  /// In en, this message translates to:
  /// **'Fajr'**
  String get prayerFajr;

  /// No description provided for @prayerSunrise.
  ///
  /// In en, this message translates to:
  /// **'Sunrise'**
  String get prayerSunrise;

  /// No description provided for @prayerDhuhr.
  ///
  /// In en, this message translates to:
  /// **'Dhuhr'**
  String get prayerDhuhr;

  /// No description provided for @prayerAsr.
  ///
  /// In en, this message translates to:
  /// **'Asr'**
  String get prayerAsr;

  /// No description provided for @prayerSunset.
  ///
  /// In en, this message translates to:
  /// **'Sunset'**
  String get prayerSunset;

  /// No description provided for @prayerMaghrib.
  ///
  /// In en, this message translates to:
  /// **'Maghrib'**
  String get prayerMaghrib;

  /// No description provided for @prayerIsha.
  ///
  /// In en, this message translates to:
  /// **'Isha'**
  String get prayerIsha;

  /// No description provided for @prayerMidnight.
  ///
  /// In en, this message translates to:
  /// **'Midnight'**
  String get prayerMidnight;

  /// No description provided for @prayerImsak.
  ///
  /// In en, this message translates to:
  /// **'Imsak'**
  String get prayerImsak;

  /// No description provided for @eventsTabAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get eventsTabAll;

  /// No description provided for @eventsTabIslamic.
  ///
  /// In en, this message translates to:
  /// **'Islamic'**
  String get eventsTabIslamic;

  /// No description provided for @eventsTabPersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get eventsTabPersonal;

  /// No description provided for @createEvent.
  ///
  /// In en, this message translates to:
  /// **'Create Event'**
  String get createEvent;

  /// No description provided for @editEvent.
  ///
  /// In en, this message translates to:
  /// **'Edit Event'**
  String get editEvent;

  /// No description provided for @deleteEvent.
  ///
  /// In en, this message translates to:
  /// **'Delete Event'**
  String get deleteEvent;

  /// No description provided for @eventTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get eventTitle;

  /// No description provided for @eventDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get eventDescription;

  /// No description provided for @eventDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get eventDate;

  /// No description provided for @eventStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get eventStartDate;

  /// No description provided for @eventEndDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get eventEndDate;

  /// No description provided for @eventReminder.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get eventReminder;

  /// No description provided for @eventCalendarType.
  ///
  /// In en, this message translates to:
  /// **'Calendar Type'**
  String get eventCalendarType;

  /// No description provided for @eventRecurrence.
  ///
  /// In en, this message translates to:
  /// **'Recurrence'**
  String get eventRecurrence;

  /// No description provided for @noEvents.
  ///
  /// In en, this message translates to:
  /// **'No events'**
  String get noEvents;

  /// No description provided for @noEventsDescription.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add an event'**
  String get noEventsDescription;

  /// No description provided for @islamicEventRamadan.
  ///
  /// In en, this message translates to:
  /// **'Ramadan'**
  String get islamicEventRamadan;

  /// No description provided for @islamicEventEidAlFitr.
  ///
  /// In en, this message translates to:
  /// **'Eid al-Fitr'**
  String get islamicEventEidAlFitr;

  /// No description provided for @islamicEventEidAlAdha.
  ///
  /// In en, this message translates to:
  /// **'Eid al-Adha'**
  String get islamicEventEidAlAdha;

  /// No description provided for @islamicEventArafah.
  ///
  /// In en, this message translates to:
  /// **'Day of Arafah'**
  String get islamicEventArafah;

  /// No description provided for @islamicEventAshura.
  ///
  /// In en, this message translates to:
  /// **'Ashura'**
  String get islamicEventAshura;

  /// No description provided for @islamicEventIslamicNewYear.
  ///
  /// In en, this message translates to:
  /// **'Islamic New Year'**
  String get islamicEventIslamicNewYear;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get settingsCalendar;

  /// No description provided for @settingsPrayer.
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get settingsPrayer;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsHijriMethod.
  ///
  /// In en, this message translates to:
  /// **'Hijri Method'**
  String get settingsHijriMethod;

  /// No description provided for @settingsHijriAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Hijri Adjustment'**
  String get settingsHijriAdjustment;

  /// No description provided for @settingsPrimaryCalendar.
  ///
  /// In en, this message translates to:
  /// **'Primary Calendar'**
  String get settingsPrimaryCalendar;

  /// No description provided for @settingsLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get settingsLocation;

  /// No description provided for @settingsCalculationMethod.
  ///
  /// In en, this message translates to:
  /// **'Calculation Method'**
  String get settingsCalculationMethod;

  /// No description provided for @settingsAsrMethod.
  ///
  /// In en, this message translates to:
  /// **'Asr Method'**
  String get settingsAsrMethod;

  /// No description provided for @settingsHighLatitudeRule.
  ///
  /// In en, this message translates to:
  /// **'High Latitude Rule'**
  String get settingsHighLatitudeRule;

  /// No description provided for @settingsEventReminders.
  ///
  /// In en, this message translates to:
  /// **'Event reminders'**
  String get settingsEventReminders;

  /// No description provided for @settingsIslamicEventReminders.
  ///
  /// In en, this message translates to:
  /// **'Islamic event reminders'**
  String get settingsIslamicEventReminders;

  /// No description provided for @settingsDailyReminder.
  ///
  /// In en, this message translates to:
  /// **'Daily reminder'**
  String get settingsDailyReminder;

  /// No description provided for @settingsPrayerReminders.
  ///
  /// In en, this message translates to:
  /// **'Prayer reminders'**
  String get settingsPrayerReminders;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsThemeSystem;

  /// No description provided for @settingsThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDark;

  /// No description provided for @calculationMethodMWL.
  ///
  /// In en, this message translates to:
  /// **'Muslim World League'**
  String get calculationMethodMWL;

  /// No description provided for @calculationMethodISNA.
  ///
  /// In en, this message translates to:
  /// **'ISNA'**
  String get calculationMethodISNA;

  /// No description provided for @calculationMethodEgyptian.
  ///
  /// In en, this message translates to:
  /// **'Egyptian'**
  String get calculationMethodEgyptian;

  /// No description provided for @calculationMethodKarachi.
  ///
  /// In en, this message translates to:
  /// **'Karachi'**
  String get calculationMethodKarachi;

  /// No description provided for @calculationMethodUmmAlQura.
  ///
  /// In en, this message translates to:
  /// **'Umm al-Qura'**
  String get calculationMethodUmmAlQura;

  /// No description provided for @calculationMethodDubai.
  ///
  /// In en, this message translates to:
  /// **'Dubai'**
  String get calculationMethodDubai;

  /// No description provided for @calculationMethodMoonsightingCommittee.
  ///
  /// In en, this message translates to:
  /// **'Moonsighting Committee'**
  String get calculationMethodMoonsightingCommittee;

  /// No description provided for @calculationMethodSingapore.
  ///
  /// In en, this message translates to:
  /// **'Singapore'**
  String get calculationMethodSingapore;

  /// No description provided for @calculationMethodCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get calculationMethodCustom;

  /// No description provided for @asrMethodStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard (Shafi\'i)'**
  String get asrMethodStandard;

  /// No description provided for @asrMethodHanafi.
  ///
  /// In en, this message translates to:
  /// **'Hanafi'**
  String get asrMethodHanafi;

  /// No description provided for @highLatRuleMiddleOfNight.
  ///
  /// In en, this message translates to:
  /// **'Middle of Night'**
  String get highLatRuleMiddleOfNight;

  /// No description provided for @highLatRuleOneSeventh.
  ///
  /// In en, this message translates to:
  /// **'One Seventh'**
  String get highLatRuleOneSeventh;

  /// No description provided for @highLatRuleAngleBased.
  ///
  /// In en, this message translates to:
  /// **'Angle Based'**
  String get highLatRuleAngleBased;

  /// No description provided for @hijriMethodUmmAlQura.
  ///
  /// In en, this message translates to:
  /// **'Umm al-Qura'**
  String get hijriMethodUmmAlQura;

  /// No description provided for @hijriMethodTabularCivil.
  ///
  /// In en, this message translates to:
  /// **'Tabular (Civil)'**
  String get hijriMethodTabularCivil;

  /// No description provided for @hijriMethodTabularAstronomical.
  ///
  /// In en, this message translates to:
  /// **'Tabular (Astronomical)'**
  String get hijriMethodTabularAstronomical;

  /// No description provided for @hijriSourceCalculated.
  ///
  /// In en, this message translates to:
  /// **'Calculated'**
  String get hijriSourceCalculated;

  /// No description provided for @hijriSourceOfficial.
  ///
  /// In en, this message translates to:
  /// **'Official'**
  String get hijriSourceOfficial;

  /// No description provided for @hijriSourceObserved.
  ///
  /// In en, this message translates to:
  /// **'Observed'**
  String get hijriSourceObserved;

  /// No description provided for @hijriSourceUserAdjusted.
  ///
  /// In en, this message translates to:
  /// **'User Adjusted'**
  String get hijriSourceUserAdjusted;

  /// No description provided for @hijriSourceRegional.
  ///
  /// In en, this message translates to:
  /// **'Regional'**
  String get hijriSourceRegional;

  /// No description provided for @locationGps.
  ///
  /// In en, this message translates to:
  /// **'GPS'**
  String get locationGps;

  /// No description provided for @locationManual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get locationManual;

  /// No description provided for @locationPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Location Permission'**
  String get locationPermissionTitle;

  /// No description provided for @locationPermissionMessage.
  ///
  /// In en, this message translates to:
  /// **'Mīzān Calendar needs your location to calculate accurate prayer times.'**
  String get locationPermissionMessage;

  /// No description provided for @locationPermissionAllow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get locationPermissionAllow;

  /// No description provided for @locationPermissionDeny.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get locationPermissionDeny;

  /// No description provided for @locationSelectCity.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get locationSelectCity;

  /// No description provided for @locationSearchCity.
  ///
  /// In en, this message translates to:
  /// **'Search city...'**
  String get locationSearchCity;

  /// No description provided for @reminderAtTime.
  ///
  /// In en, this message translates to:
  /// **'At time of event'**
  String get reminderAtTime;

  /// No description provided for @reminderMinutes.
  ///
  /// In en, this message translates to:
  /// **'{count} minutes before'**
  String reminderMinutes(int count);

  /// No description provided for @reminderHours.
  ///
  /// In en, this message translates to:
  /// **'{count} hours before'**
  String reminderHours(int count);

  /// No description provided for @reminderDays.
  ///
  /// In en, this message translates to:
  /// **'{count} days before'**
  String reminderDays(int count);

  /// No description provided for @reminderNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get reminderNone;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorCalendarCalculation.
  ///
  /// In en, this message translates to:
  /// **'Calendar calculation error.'**
  String get errorCalendarCalculation;

  /// No description provided for @errorDatabase.
  ///
  /// In en, this message translates to:
  /// **'Database error. Please restart the app.'**
  String get errorDatabase;

  /// No description provided for @errorLocation.
  ///
  /// In en, this message translates to:
  /// **'Could not determine your location.'**
  String get errorLocation;

  /// No description provided for @errorPrayerCalculation.
  ///
  /// In en, this message translates to:
  /// **'Prayer time calculation error.'**
  String get errorPrayerCalculation;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @weekdayMonday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get weekdayMonday;

  /// No description provided for @weekdayTuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get weekdayTuesday;

  /// No description provided for @weekdayWednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get weekdayWednesday;

  /// No description provided for @weekdayThursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get weekdayThursday;

  /// No description provided for @weekdayFriday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get weekdayFriday;

  /// No description provided for @weekdaySaturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get weekdaySaturday;

  /// No description provided for @weekdaySunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get weekdaySunday;

  /// No description provided for @weekdayShortMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get weekdayShortMon;

  /// No description provided for @weekdayShortTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get weekdayShortTue;

  /// No description provided for @weekdayShortWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get weekdayShortWed;

  /// No description provided for @weekdayShortThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get weekdayShortThu;

  /// No description provided for @weekdayShortFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get weekdayShortFri;

  /// No description provided for @weekdayShortSat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get weekdayShortSat;

  /// No description provided for @weekdayShortSun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get weekdayShortSun;

  /// No description provided for @hijriMonthMuharram.
  ///
  /// In en, this message translates to:
  /// **'Muharram'**
  String get hijriMonthMuharram;

  /// No description provided for @hijriMonthSafar.
  ///
  /// In en, this message translates to:
  /// **'Safar'**
  String get hijriMonthSafar;

  /// No description provided for @hijriMonthRabiAlAwwal.
  ///
  /// In en, this message translates to:
  /// **'Rabi\' al-Awwal'**
  String get hijriMonthRabiAlAwwal;

  /// No description provided for @hijriMonthRabiAlThani.
  ///
  /// In en, this message translates to:
  /// **'Rabi\' al-Thani'**
  String get hijriMonthRabiAlThani;

  /// No description provided for @hijriMonthJumadaAlUla.
  ///
  /// In en, this message translates to:
  /// **'Jumada al-Ula'**
  String get hijriMonthJumadaAlUla;

  /// No description provided for @hijriMonthJumadaAlAkhira.
  ///
  /// In en, this message translates to:
  /// **'Jumada al-Akhira'**
  String get hijriMonthJumadaAlAkhira;

  /// No description provided for @hijriMonthRajab.
  ///
  /// In en, this message translates to:
  /// **'Rajab'**
  String get hijriMonthRajab;

  /// No description provided for @hijriMonthShaban.
  ///
  /// In en, this message translates to:
  /// **'Sha\'ban'**
  String get hijriMonthShaban;

  /// No description provided for @hijriMonthRamadan.
  ///
  /// In en, this message translates to:
  /// **'Ramadan'**
  String get hijriMonthRamadan;

  /// No description provided for @hijriMonthShawwal.
  ///
  /// In en, this message translates to:
  /// **'Shawwal'**
  String get hijriMonthShawwal;

  /// No description provided for @hijriMonthDhulQadah.
  ///
  /// In en, this message translates to:
  /// **'Dhul-Qa\'dah'**
  String get hijriMonthDhulQadah;

  /// No description provided for @hijriMonthDhulHijja.
  ///
  /// In en, this message translates to:
  /// **'Dhul-Hijja'**
  String get hijriMonthDhulHijja;

  /// Anno Hegirae suffix
  ///
  /// In en, this message translates to:
  /// **'AH'**
  String get ahSuffix;

  /// No description provided for @eventIslamicNewYear.
  ///
  /// In en, this message translates to:
  /// **'Islamic New Year'**
  String get eventIslamicNewYear;

  /// No description provided for @eventIslamicNewYearDesc.
  ///
  /// In en, this message translates to:
  /// **'1st of Muharram, marks the beginning of the new Islamic lunar year.'**
  String get eventIslamicNewYearDesc;

  /// No description provided for @eventAshura.
  ///
  /// In en, this message translates to:
  /// **'Day of Ashura'**
  String get eventAshura;

  /// No description provided for @eventAshuraDesc.
  ///
  /// In en, this message translates to:
  /// **'10th of Muharram, a day of fasting and historic deliverance.'**
  String get eventAshuraDesc;

  /// No description provided for @eventMawlidAlNabi.
  ///
  /// In en, this message translates to:
  /// **'Mawlid al-Nabi'**
  String get eventMawlidAlNabi;

  /// No description provided for @eventMawlidAlNabiDesc.
  ///
  /// In en, this message translates to:
  /// **'12th of Rabi\' al-Awwal, commemorating the birth of Prophet Muhammad ﷺ.'**
  String get eventMawlidAlNabiDesc;

  /// No description provided for @eventIsraWalMiraj.
  ///
  /// In en, this message translates to:
  /// **'Isra and Mi\'raj'**
  String get eventIsraWalMiraj;

  /// No description provided for @eventIsraWalMirajDesc.
  ///
  /// In en, this message translates to:
  /// **'27th of Rajab, the miraculous night journey and ascension to the heavens.'**
  String get eventIsraWalMirajDesc;

  /// No description provided for @eventNisfShaban.
  ///
  /// In en, this message translates to:
  /// **'Mid-Sha\'ban (Nisf Sha\'ban)'**
  String get eventNisfShaban;

  /// No description provided for @eventNisfShabanDesc.
  ///
  /// In en, this message translates to:
  /// **'15th of Sha\'ban, a blessed night preceding Ramadan.'**
  String get eventNisfShabanDesc;

  /// No description provided for @eventRamadan.
  ///
  /// In en, this message translates to:
  /// **'First Day of Ramadan'**
  String get eventRamadan;

  /// No description provided for @eventRamadanDesc.
  ///
  /// In en, this message translates to:
  /// **'The holy month of fasting, prayer, reflection, and community.'**
  String get eventRamadanDesc;

  /// No description provided for @eventLaylatAlQadr.
  ///
  /// In en, this message translates to:
  /// **'Laylat al-Qadr (Night of Power)'**
  String get eventLaylatAlQadr;

  /// No description provided for @eventLaylatAlQadrDesc.
  ///
  /// In en, this message translates to:
  /// **'The holiest night of the year, better than a thousand months.'**
  String get eventLaylatAlQadrDesc;

  /// No description provided for @eventEidAlFitr.
  ///
  /// In en, this message translates to:
  /// **'Eid al-Fitr'**
  String get eventEidAlFitr;

  /// No description provided for @eventEidAlFitrDesc.
  ///
  /// In en, this message translates to:
  /// **'Celebration marking the conclusion of the holy month of Ramadan.'**
  String get eventEidAlFitrDesc;

  /// No description provided for @eventDayOfTarwiyah.
  ///
  /// In en, this message translates to:
  /// **'Day of Tarwiyah'**
  String get eventDayOfTarwiyah;

  /// No description provided for @eventDayOfTarwiyahDesc.
  ///
  /// In en, this message translates to:
  /// **'8th of Dhul-Hijja, pilgrims proceed to Mina for the rites of Hajj.'**
  String get eventDayOfTarwiyahDesc;

  /// No description provided for @eventDayOfArafah.
  ///
  /// In en, this message translates to:
  /// **'Day of Arafah'**
  String get eventDayOfArafah;

  /// No description provided for @eventDayOfArafahDesc.
  ///
  /// In en, this message translates to:
  /// **'9th of Dhul-Hijja, the pinnacle of the Hajj pilgrimage and a day of forgiveness.'**
  String get eventDayOfArafahDesc;

  /// No description provided for @eventEidAlAdha.
  ///
  /// In en, this message translates to:
  /// **'Eid al-Adha'**
  String get eventEidAlAdha;

  /// No description provided for @eventEidAlAdhaDesc.
  ///
  /// In en, this message translates to:
  /// **'Feast of the Sacrifice commemorating the devotion of Prophet Ibrahim (AS).'**
  String get eventEidAlAdhaDesc;

  /// No description provided for @eventDaysOfTashreeq.
  ///
  /// In en, this message translates to:
  /// **'Days of Tashreeq'**
  String get eventDaysOfTashreeq;

  /// No description provided for @eventDaysOfTashreeqDesc.
  ///
  /// In en, this message translates to:
  /// **'11th-13th of Dhul-Hijja, days of celebration and remembrance following Eid.'**
  String get eventDaysOfTashreeqDesc;

  /// No description provided for @eventsAddEvent.
  ///
  /// In en, this message translates to:
  /// **'Add Event'**
  String get eventsAddEvent;

  /// No description provided for @eventsCreateEvent.
  ///
  /// In en, this message translates to:
  /// **'New Event'**
  String get eventsCreateEvent;

  /// No description provided for @eventsEditEvent.
  ///
  /// In en, this message translates to:
  /// **'Edit Event'**
  String get eventsEditEvent;

  /// No description provided for @eventsEventDetails.
  ///
  /// In en, this message translates to:
  /// **'Event Details'**
  String get eventsEventDetails;

  /// No description provided for @eventsTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get eventsTitle;

  /// No description provided for @eventsTitleRequired.
  ///
  /// In en, this message translates to:
  /// **'Title is required'**
  String get eventsTitleRequired;

  /// No description provided for @eventsDescription.
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get eventsDescription;

  /// No description provided for @eventsCalendarType.
  ///
  /// In en, this message translates to:
  /// **'Calendar System'**
  String get eventsCalendarType;

  /// No description provided for @eventsGregorian.
  ///
  /// In en, this message translates to:
  /// **'Gregorian'**
  String get eventsGregorian;

  /// No description provided for @eventsHijri.
  ///
  /// In en, this message translates to:
  /// **'Hijri'**
  String get eventsHijri;

  /// No description provided for @eventsDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get eventsDate;

  /// No description provided for @eventsTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get eventsTime;

  /// No description provided for @eventsAllDay.
  ///
  /// In en, this message translates to:
  /// **'All Day'**
  String get eventsAllDay;

  /// No description provided for @eventsRecurrence.
  ///
  /// In en, this message translates to:
  /// **'Repeat'**
  String get eventsRecurrence;

  /// No description provided for @eventsRecurrenceNone.
  ///
  /// In en, this message translates to:
  /// **'Does not repeat'**
  String get eventsRecurrenceNone;

  /// No description provided for @eventsRecurrenceDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get eventsRecurrenceDaily;

  /// No description provided for @eventsRecurrenceWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get eventsRecurrenceWeekly;

  /// No description provided for @eventsRecurrenceMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get eventsRecurrenceMonthly;

  /// No description provided for @eventsRecurrenceYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get eventsRecurrenceYearly;

  /// No description provided for @eventsReminder.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get eventsReminder;

  /// No description provided for @eventsReminderNone.
  ///
  /// In en, this message translates to:
  /// **'No reminder'**
  String get eventsReminderNone;

  /// No description provided for @eventsReminderAtTime.
  ///
  /// In en, this message translates to:
  /// **'At time of event'**
  String get eventsReminderAtTime;

  /// No description provided for @eventsReminder15Min.
  ///
  /// In en, this message translates to:
  /// **'15 minutes before'**
  String get eventsReminder15Min;

  /// No description provided for @eventsReminder30Min.
  ///
  /// In en, this message translates to:
  /// **'30 minutes before'**
  String get eventsReminder30Min;

  /// No description provided for @eventsReminder1Hour.
  ///
  /// In en, this message translates to:
  /// **'1 hour before'**
  String get eventsReminder1Hour;

  /// No description provided for @eventsReminder1Day.
  ///
  /// In en, this message translates to:
  /// **'1 day before'**
  String get eventsReminder1Day;

  /// No description provided for @eventsColor.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get eventsColor;

  /// No description provided for @eventsSave.
  ///
  /// In en, this message translates to:
  /// **'Save Event'**
  String get eventsSave;

  /// No description provided for @eventsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete Event'**
  String get eventsDelete;

  /// No description provided for @eventsDeleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Event?'**
  String get eventsDeleteConfirmTitle;

  /// No description provided for @eventsDeleteConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this event?'**
  String get eventsDeleteConfirmMessage;

  /// No description provided for @eventsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get eventsCancel;

  /// No description provided for @eventsNoEvents.
  ///
  /// In en, this message translates to:
  /// **'No events found'**
  String get eventsNoEvents;

  /// No description provided for @eventsNoPersonalEvents.
  ///
  /// In en, this message translates to:
  /// **'No personal events yet. Tap + to add one.'**
  String get eventsNoPersonalEvents;

  /// No description provided for @eventsMajor.
  ///
  /// In en, this message translates to:
  /// **'Major Occasion'**
  String get eventsMajor;

  /// No description provided for @eventsUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Events'**
  String get eventsUpcoming;

  /// No description provided for @eventsViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get eventsViewAll;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
