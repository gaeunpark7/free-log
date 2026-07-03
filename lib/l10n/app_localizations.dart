import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
    Locale('en'),
    Locale('ko'),
  ];

  /// No description provided for @appName.
  ///
  /// In ko, this message translates to:
  /// **'프리로그'**
  String get appName;

  /// No description provided for @home.
  ///
  /// In ko, this message translates to:
  /// **'홈'**
  String get home;

  /// No description provided for @calendar.
  ///
  /// In ko, this message translates to:
  /// **'캘린더'**
  String get calendar;

  /// No description provided for @calculator.
  ///
  /// In ko, this message translates to:
  /// **'계산기'**
  String get calculator;

  /// No description provided for @profile.
  ///
  /// In ko, this message translates to:
  /// **'내 정보'**
  String get profile;

  /// No description provided for @myProject.
  ///
  /// In ko, this message translates to:
  /// **'내 작업'**
  String get myProject;

  /// No description provided for @projectStatus.
  ///
  /// In ko, this message translates to:
  /// **'진행중 {inProgress}  ⦁  완료 {completed}'**
  String projectStatus(int inProgress, int completed);

  /// No description provided for @all.
  ///
  /// In ko, this message translates to:
  /// **'전체'**
  String get all;

  /// No description provided for @inProgress.
  ///
  /// In ko, this message translates to:
  /// **'진행중'**
  String get inProgress;

  /// No description provided for @onHold.
  ///
  /// In ko, this message translates to:
  /// **'보류'**
  String get onHold;

  /// No description provided for @completed.
  ///
  /// In ko, this message translates to:
  /// **'완료'**
  String get completed;

  /// No description provided for @addProject.
  ///
  /// In ko, this message translates to:
  /// **'작업 추가'**
  String get addProject;

  /// No description provided for @addProjectSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'새로운 프리랜서 작업을 등록합니다'**
  String get addProjectSubtitle;

  /// No description provided for @projectName.
  ///
  /// In ko, this message translates to:
  /// **'작업명'**
  String get projectName;

  /// No description provided for @projectNameHint.
  ///
  /// In ko, this message translates to:
  /// **'작업명을 입력하세요'**
  String get projectNameHint;

  /// No description provided for @projectNameError.
  ///
  /// In ko, this message translates to:
  /// **'작업명을 입력하세요'**
  String get projectNameError;

  /// No description provided for @hourlyRate.
  ///
  /// In ko, this message translates to:
  /// **'시급'**
  String get hourlyRate;

  /// No description provided for @hourlyRateHint.
  ///
  /// In ko, this message translates to:
  /// **'시급을 입력하세요'**
  String get hourlyRateHint;

  /// No description provided for @hourlyRateError.
  ///
  /// In ko, this message translates to:
  /// **'시급을 입력하세요'**
  String get hourlyRateError;

  /// No description provided for @deadline.
  ///
  /// In ko, this message translates to:
  /// **'마감일'**
  String get deadline;

  /// No description provided for @deadlineHint.
  ///
  /// In ko, this message translates to:
  /// **'연도-월-일'**
  String get deadlineHint;

  /// No description provided for @deadlineError.
  ///
  /// In ko, this message translates to:
  /// **'마감일을 입력하세요'**
  String get deadlineError;

  /// No description provided for @save.
  ///
  /// In ko, this message translates to:
  /// **'저장'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In ko, this message translates to:
  /// **'취소'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In ko, this message translates to:
  /// **'삭제'**
  String get delete;

  /// No description provided for @projectAdded.
  ///
  /// In ko, this message translates to:
  /// **'프로젝트 추가 완료'**
  String get projectAdded;

  /// No description provided for @editProject.
  ///
  /// In ko, this message translates to:
  /// **'작업 수정'**
  String get editProject;

  /// No description provided for @markAsCompleted.
  ///
  /// In ko, this message translates to:
  /// **'완료로 변경'**
  String get markAsCompleted;

  /// No description provided for @deleteProject.
  ///
  /// In ko, this message translates to:
  /// **'삭제'**
  String get deleteProject;

  /// No description provided for @deleteConfirm.
  ///
  /// In ko, this message translates to:
  /// **'작업을 삭제할까요?'**
  String get deleteConfirm;

  /// No description provided for @deleteWarning.
  ///
  /// In ko, this message translates to:
  /// **'작업이 영구적으로 삭제됩니다.'**
  String get deleteWarning;

  /// No description provided for @noTimeEntries.
  ///
  /// In ko, this message translates to:
  /// **'아직 기록된 작업이 없어요.'**
  String get noTimeEntries;

  /// No description provided for @deleteRecordTitle.
  ///
  /// In ko, this message translates to:
  /// **'기록을 삭제할까요?'**
  String get deleteRecordTitle;

  /// No description provided for @deleteRecordMessage.
  ///
  /// In ko, this message translates to:
  /// **'기록이 영구적으로 삭제됩니다.'**
  String get deleteRecordMessage;

  /// No description provided for @todoTab.
  ///
  /// In ko, this message translates to:
  /// **'할 일 ({count})'**
  String todoTab(int count);

  /// No description provided for @doneTab.
  ///
  /// In ko, this message translates to:
  /// **'완료 ({count})'**
  String doneTab(int count);

  /// No description provided for @todos.
  ///
  /// In ko, this message translates to:
  /// **'할 일'**
  String get todos;

  /// No description provided for @done.
  ///
  /// In ko, this message translates to:
  /// **'완료'**
  String get done;

  /// No description provided for @addTodo.
  ///
  /// In ko, this message translates to:
  /// **'+ 추가'**
  String get addTodo;

  /// No description provided for @todosHint.
  ///
  /// In ko, this message translates to:
  /// **'할 일 입력'**
  String get todosHint;

  /// No description provided for @editTodo.
  ///
  /// In ko, this message translates to:
  /// **'할 일 수정'**
  String get editTodo;

  /// No description provided for @valieTodo.
  ///
  /// In ko, this message translates to:
  /// **'내용을 입력하세요'**
  String get valieTodo;

  /// No description provided for @date.
  ///
  /// In ko, this message translates to:
  /// **'날짜'**
  String get date;

  /// No description provided for @add.
  ///
  /// In ko, this message translates to:
  /// **'추가'**
  String get add;

  /// No description provided for @update.
  ///
  /// In ko, this message translates to:
  /// **'수정'**
  String get update;

  /// No description provided for @ok.
  ///
  /// In ko, this message translates to:
  /// **'확인'**
  String get ok;

  /// No description provided for @editExpense.
  ///
  /// In ko, this message translates to:
  /// **'지출 수정'**
  String get editExpense;

  /// No description provided for @editIncome.
  ///
  /// In ko, this message translates to:
  /// **'수입 수정'**
  String get editIncome;

  /// No description provided for @costDetails.
  ///
  /// In ko, this message translates to:
  /// **'원가 내역'**
  String get costDetails;

  /// No description provided for @paymentReceived.
  ///
  /// In ko, this message translates to:
  /// **'받은 금액'**
  String get paymentReceived;

  /// No description provided for @item.
  ///
  /// In ko, this message translates to:
  /// **'항목'**
  String get item;

  /// No description provided for @itemHint.
  ///
  /// In ko, this message translates to:
  /// **'항목명'**
  String get itemHint;

  /// No description provided for @valieItem.
  ///
  /// In ko, this message translates to:
  /// **'항목을 입력하세요'**
  String get valieItem;

  /// No description provided for @amount.
  ///
  /// In ko, this message translates to:
  /// **'금액'**
  String get amount;

  /// No description provided for @amountHint.
  ///
  /// In ko, this message translates to:
  /// **'금액'**
  String get amountHint;

  /// No description provided for @valieAmount.
  ///
  /// In ko, this message translates to:
  /// **'금액을 입력하세요'**
  String get valieAmount;

  /// No description provided for @timeEntries.
  ///
  /// In ko, this message translates to:
  /// **'작업 시간'**
  String get timeEntries;

  /// No description provided for @timeEntry.
  ///
  /// In ko, this message translates to:
  /// **'작업 시간'**
  String get timeEntry;

  /// No description provided for @timeEntryTitle.
  ///
  /// In ko, this message translates to:
  /// **'작업 시간'**
  String get timeEntryTitle;

  /// No description provided for @totalTimeEntries.
  ///
  /// In ko, this message translates to:
  /// **'총 작업 시간'**
  String get totalTimeEntries;

  /// No description provided for @hours.
  ///
  /// In ko, this message translates to:
  /// **'시간'**
  String get hours;

  /// No description provided for @records.
  ///
  /// In ko, this message translates to:
  /// **'기록내역'**
  String get records;

  /// No description provided for @editTimeEntry.
  ///
  /// In ko, this message translates to:
  /// **'작업 시간 기록'**
  String get editTimeEntry;

  /// No description provided for @expense.
  ///
  /// In ko, this message translates to:
  /// **'지출'**
  String get expense;

  /// No description provided for @income.
  ///
  /// In ko, this message translates to:
  /// **'수익'**
  String get income;

  /// No description provided for @calculation.
  ///
  /// In ko, this message translates to:
  /// **'금액 산출'**
  String get calculation;

  /// No description provided for @hourlyRateXHours.
  ///
  /// In ko, this message translates to:
  /// **'시급 X 시간'**
  String get hourlyRateXHours;

  /// No description provided for @margin.
  ///
  /// In ko, this message translates to:
  /// **'마진 ({rate}%)'**
  String margin(int rate);

  /// No description provided for @marginRate.
  ///
  /// In ko, this message translates to:
  /// **'마진율'**
  String get marginRate;

  /// No description provided for @sellingPrice.
  ///
  /// In ko, this message translates to:
  /// **'판매가'**
  String get sellingPrice;

  /// No description provided for @settings.
  ///
  /// In ko, this message translates to:
  /// **'기본 설정'**
  String get settings;

  /// No description provided for @defaultHourlyRate.
  ///
  /// In ko, this message translates to:
  /// **'기본 시급'**
  String get defaultHourlyRate;

  /// No description provided for @defaultMargin.
  ///
  /// In ko, this message translates to:
  /// **'기본 마진율'**
  String get defaultMargin;

  /// No description provided for @deadlineReminders.
  ///
  /// In ko, this message translates to:
  /// **'마감일 알림'**
  String get deadlineReminders;

  /// No description provided for @thisMonth.
  ///
  /// In ko, this message translates to:
  /// **'이번달'**
  String get thisMonth;

  /// No description provided for @allTime.
  ///
  /// In ko, this message translates to:
  /// **'전체'**
  String get allTime;

  /// No description provided for @activeProjects.
  ///
  /// In ko, this message translates to:
  /// **'진행중 작업'**
  String get activeProjects;

  /// No description provided for @totalHours.
  ///
  /// In ko, this message translates to:
  /// **'총 작업 시간'**
  String get totalHours;

  /// No description provided for @revenue.
  ///
  /// In ko, this message translates to:
  /// **'받은 수익'**
  String get revenue;

  /// No description provided for @expenses.
  ///
  /// In ko, this message translates to:
  /// **'지출'**
  String get expenses;

  /// No description provided for @netProfit.
  ///
  /// In ko, this message translates to:
  /// **'순수익'**
  String get netProfit;

  /// No description provided for @privacyPolicy.
  ///
  /// In ko, this message translates to:
  /// **'개인정보 처리방침'**
  String get privacyPolicy;

  /// No description provided for @reportBug.
  ///
  /// In ko, this message translates to:
  /// **'오류 문의'**
  String get reportBug;

  /// No description provided for @signOut.
  ///
  /// In ko, this message translates to:
  /// **'로그아웃'**
  String get signOut;

  /// No description provided for @editSettings.
  ///
  /// In ko, this message translates to:
  /// **'기본 설정 수정'**
  String get editSettings;

  /// No description provided for @marginRateHint.
  ///
  /// In ko, this message translates to:
  /// **'마진율을 입력하세요'**
  String get marginRateHint;

  /// No description provided for @marginRateError.
  ///
  /// In ko, this message translates to:
  /// **'마진율을 입력하세요'**
  String get marginRateError;
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
      <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
