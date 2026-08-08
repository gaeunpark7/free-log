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

  /// No description provided for @enterHoursOrMinutes.
  ///
  /// In ko, this message translates to:
  /// **'시간 또는 분을 입력해주세요'**
  String get enterHoursOrMinutes;

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

  /// No description provided for @settingsBasic.
  ///
  /// In ko, this message translates to:
  /// **'기본 설정'**
  String get settingsBasic;

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

  /// No description provided for @privacyPolicyCollectingInfo.
  ///
  /// In ko, this message translates to:
  /// **'1. 수집하는 개인정보'**
  String get privacyPolicyCollectingInfo;

  /// No description provided for @privacyPolicyLoginInfo.
  ///
  /// In ko, this message translates to:
  /// **'① 로그인 및 사용자 정보'**
  String get privacyPolicyLoginInfo;

  /// No description provided for @privacyPolicySocialLoginInfo.
  ///
  /// In ko, this message translates to:
  /// **'- 소셜 로그인 정보'**
  String get privacyPolicySocialLoginInfo;

  /// No description provided for @privacyPolicyGoogleLoginInfo.
  ///
  /// In ko, this message translates to:
  /// **'   - Google 로그인: 이메일, 닉네임, 계정 고유 ID'**
  String get privacyPolicyGoogleLoginInfo;

  /// No description provided for @privacyPolicyKakaoLoginInfo.
  ///
  /// In ko, this message translates to:
  /// **'   - Kakao 로그인: 이메일, 닉네임, 계정 고유 ID'**
  String get privacyPolicyKakaoLoginInfo;

  /// No description provided for @privacyPolicyNicknameInfo.
  ///
  /// In ko, this message translates to:
  /// **'- 사용자 닉네임 (앱 최초 실행 시 설정)'**
  String get privacyPolicyNicknameInfo;

  /// No description provided for @privacyPolicyServiceUsageInfo.
  ///
  /// In ko, this message translates to:
  /// **'② 서비스 이용 정보'**
  String get privacyPolicyServiceUsageInfo;

  /// No description provided for @privacyPolicyProjectInfo.
  ///
  /// In ko, this message translates to:
  /// **'- 프로젝트 정보'**
  String get privacyPolicyProjectInfo;

  /// No description provided for @privacyPolicyTodoTimeInfo.
  ///
  /// In ko, this message translates to:
  /// **'- 할 일 및 작업 시간 기록'**
  String get privacyPolicyTodoTimeInfo;

  /// No description provided for @privacyPolicyIncomeExpenseInfo.
  ///
  /// In ko, this message translates to:
  /// **'- 수입 및 지출 내역'**
  String get privacyPolicyIncomeExpenseInfo;

  /// No description provided for @privacyPolicyCalendarStatsInfo.
  ///
  /// In ko, this message translates to:
  /// **'- 캘린더 및 통계 데이터'**
  String get privacyPolicyCalendarStatsInfo;

  /// No description provided for @privacyPolicyDefaultSettingsInfo.
  ///
  /// In ko, this message translates to:
  /// **'- 기본 시급 및 기본 마진율 설정'**
  String get privacyPolicyDefaultSettingsInfo;

  /// No description provided for @privacyPolicyAdInfo.
  ///
  /// In ko, this message translates to:
  /// **'③ 광고 관련 정보'**
  String get privacyPolicyAdInfo;

  /// No description provided for @privacyPolicyAdInfoDetail.
  ///
  /// In ko, this message translates to:
  /// **'- 광고 플랫폼에서 자동 수집될 수 있음'**
  String get privacyPolicyAdInfoDetail;

  /// No description provided for @privacyPolicyPurposeTitle.
  ///
  /// In ko, this message translates to:
  /// **'2. 개인정보의 수집 및 이용 목적'**
  String get privacyPolicyPurposeTitle;

  /// No description provided for @privacyPolicyPurposeIntro.
  ///
  /// In ko, this message translates to:
  /// **'수집한 개인정보는 다음 목적을 위해 사용됩니다.'**
  String get privacyPolicyPurposeIntro;

  /// No description provided for @privacyPolicyPurposeIdentity.
  ///
  /// In ko, this message translates to:
  /// **'- 사용자 식별 및 로그인 기능 제공'**
  String get privacyPolicyPurposeIdentity;

  /// No description provided for @privacyPolicyPurposeManagement.
  ///
  /// In ko, this message translates to:
  /// **'- 프로젝트, 작업 시간, 수입, 지출 관리 서비스 제공'**
  String get privacyPolicyPurposeManagement;

  /// No description provided for @privacyPolicyPurposeSync.
  ///
  /// In ko, this message translates to:
  /// **'- 데이터 저장 및 기기 간 동기화'**
  String get privacyPolicyPurposeSync;

  /// No description provided for @privacyPolicyPurposeAds.
  ///
  /// In ko, this message translates to:
  /// **'- 광고 노출 및 서비스 개선'**
  String get privacyPolicyPurposeAds;

  /// No description provided for @privacyPolicyStorageTitle.
  ///
  /// In ko, this message translates to:
  /// **'3. 개인정보의 보관 처리'**
  String get privacyPolicyStorageTitle;

  /// No description provided for @privacyPolicyStorageSupabase.
  ///
  /// In ko, this message translates to:
  /// **'- 본 서비스는 Supabase를 이용하여 개인정보를 저장 및 관리합니다.'**
  String get privacyPolicyStorageSupabase;

  /// No description provided for @privacyPolicyStoragePurpose.
  ///
  /// In ko, this message translates to:
  /// **'- 개인정보는 서비스 제공 목적 범위 내에서만 처리되며, 목적 외 사용은 하지 않습니다.'**
  String get privacyPolicyStoragePurpose;

  /// No description provided for @privacyPolicyRetentionTitle.
  ///
  /// In ko, this message translates to:
  /// **'4. 개인정보 보관 기간'**
  String get privacyPolicyRetentionTitle;

  /// No description provided for @privacyPolicyRetentionDelete.
  ///
  /// In ko, this message translates to:
  /// **'- 이용자가 회원 탈퇴를 요청할 경우, 관련 법령에 따라 보관이 필요한 정보를 제외하고 개인정보는 즉시 삭제됩니다.'**
  String get privacyPolicyRetentionDelete;

  /// No description provided for @privacyPolicyRetentionLegal.
  ///
  /// In ko, this message translates to:
  /// **'- 단, 관계 법령에 따라 일정 기간 보관이 필요한 경우 해당 기간 동안 안전하게 보관됩니다.'**
  String get privacyPolicyRetentionLegal;

  /// No description provided for @privacyPolicyThirdPartyTitle.
  ///
  /// In ko, this message translates to:
  /// **'5. 개인정보 제3자 제공'**
  String get privacyPolicyThirdPartyTitle;

  /// No description provided for @privacyPolicyThirdPartyNoShare.
  ///
  /// In ko, this message translates to:
  /// **'- 본 앱은 법령에 의한 경우를 제외하고 개인정보를 제3자에게 제공하지 않습니다.'**
  String get privacyPolicyThirdPartyNoShare;

  /// No description provided for @privacyPolicyThirdPartyAdmob.
  ///
  /// In ko, this message translates to:
  /// **'- 광고 제공을 위해 Google AdMob SDK가 이용될 수 있으며, 이 과정에서 광고 식별자(AD ID) 등 일부 정보가 자동으로 처리될 수 있습니다.'**
  String get privacyPolicyThirdPartyAdmob;

  /// No description provided for @privacyPolicyEntrustTitle.
  ///
  /// In ko, this message translates to:
  /// **'6. 개인정보 처리 위탁'**
  String get privacyPolicyEntrustTitle;

  /// No description provided for @privacyPolicyEntrustIntro.
  ///
  /// In ko, this message translates to:
  /// **'서비스 제공을 위해 아래와 같은 외부 서비스를 이용할 수 있습니다.'**
  String get privacyPolicyEntrustIntro;

  /// No description provided for @privacyPolicyEntrustSupabase.
  ///
  /// In ko, this message translates to:
  /// **'- Supabase (데이터 저장 및 백엔드 서비스)'**
  String get privacyPolicyEntrustSupabase;

  /// No description provided for @privacyPolicyEntrustGoogleKakao.
  ///
  /// In ko, this message translates to:
  /// **'- Google / Kakao (소셜 로그인)'**
  String get privacyPolicyEntrustGoogleKakao;

  /// No description provided for @privacyPolicyEntrustAdmob.
  ///
  /// In ko, this message translates to:
  /// **'- Google AdMob (광고 제공)'**
  String get privacyPolicyEntrustAdmob;

  /// No description provided for @privacyPolicyRightsTitle.
  ///
  /// In ko, this message translates to:
  /// **'7. 이용자의 권리'**
  String get privacyPolicyRightsTitle;

  /// No description provided for @privacyPolicyRightsDesc.
  ///
  /// In ko, this message translates to:
  /// **'이용자는 언제든지 본인의 개인정보 조회, 수정, 삭제(회원 탈퇴)를 요청할 수 있습니다.'**
  String get privacyPolicyRightsDesc;

  /// No description provided for @privacyPolicyInquiryTitle.
  ///
  /// In ko, this message translates to:
  /// **'8. 개인정보 보호 문의'**
  String get privacyPolicyInquiryTitle;

  /// No description provided for @privacyPolicyInquiryDesc.
  ///
  /// In ko, this message translates to:
  /// **'개인정보와 관련한 문의사항은 아래 로 문의해 주세요.'**
  String get privacyPolicyInquiryDesc;

  /// No description provided for @privacyPolicyEmailLabel.
  ///
  /// In ko, this message translates to:
  /// **'- 이메일:'**
  String get privacyPolicyEmailLabel;

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

  /// No description provided for @nickName.
  ///
  /// In ko, this message translates to:
  /// **'이름'**
  String get nickName;

  /// No description provided for @editNickname.
  ///
  /// In ko, this message translates to:
  /// **'닉네임 변경'**
  String get editNickname;

  /// No description provided for @nicknameHint.
  ///
  /// In ko, this message translates to:
  /// **'새로운 닉네임을 입력하세요'**
  String get nicknameHint;

  /// No description provided for @nicknameError.
  ///
  /// In ko, this message translates to:
  /// **'닉네임을 입력하세요'**
  String get nicknameError;

  /// No description provided for @email.
  ///
  /// In ko, this message translates to:
  /// **'이메일'**
  String get email;

  /// No description provided for @userFailled.
  ///
  /// In ko, this message translates to:
  /// **'유저 정보를 불러오지 못했습니다.'**
  String get userFailled;

  /// No description provided for @fetchFailed.
  ///
  /// In ko, this message translates to:
  /// **' 데이터를 불러오지 못했습니다.'**
  String get fetchFailed;

  /// No description provided for @saveFailed.
  ///
  /// In ko, this message translates to:
  /// **'요청에 실패하였습니다. 다시 시도해주세요'**
  String get saveFailed;

  /// No description provided for @checkInternet.
  ///
  /// In ko, this message translates to:
  /// **'인터넷 연결을 확인해주세요.'**
  String get checkInternet;

  /// No description provided for @unknownError.
  ///
  /// In ko, this message translates to:
  /// **'알 수 없는 에러가 발생하였습니다.'**
  String get unknownError;

  /// No description provided for @today.
  ///
  /// In ko, this message translates to:
  /// **'오늘'**
  String get today;

  /// No description provided for @noRecord.
  ///
  /// In ko, this message translates to:
  /// **'기록이 없어요.'**
  String get noRecord;

  /// No description provided for @priceCalculator.
  ///
  /// In ko, this message translates to:
  /// **'가격 계산기'**
  String get priceCalculator;

  /// No description provided for @quickEstimate.
  ///
  /// In ko, this message translates to:
  /// **'즉석 금액 산출'**
  String get quickEstimate;

  /// No description provided for @app.
  ///
  /// In ko, this message translates to:
  /// **'앱 정보'**
  String get app;

  /// No description provided for @account.
  ///
  /// In ko, this message translates to:
  /// **'계정 관리'**
  String get account;

  /// No description provided for @settings.
  ///
  /// In ko, this message translates to:
  /// **'설정'**
  String get settings;

  /// No description provided for @settingsData.
  ///
  /// In ko, this message translates to:
  /// **'데이터 수집 및 이용 안내'**
  String get settingsData;

  /// No description provided for @settingsBug.
  ///
  /// In ko, this message translates to:
  /// **'버그 신고 및 문의'**
  String get settingsBug;

  /// No description provided for @deleteAccount.
  ///
  /// In ko, this message translates to:
  /// **'회원탈퇴'**
  String get deleteAccount;

  /// No description provided for @settingsDelete.
  ///
  /// In ko, this message translates to:
  /// **'모든 데이터 영구 삭제'**
  String get settingsDelete;

  /// No description provided for @authError.
  ///
  /// In ko, this message translates to:
  /// **'로그인에 실패했습니다. 다시 시도해주세요'**
  String get authError;

  /// No description provided for @loginKakao.
  ///
  /// In ko, this message translates to:
  /// **'카카오 계정으로 계속하기'**
  String get loginKakao;

  /// No description provided for @loginGoogle.
  ///
  /// In ko, this message translates to:
  /// **'구글 계정으로 계속하기'**
  String get loginGoogle;

  /// No description provided for @loginSubTitle.
  ///
  /// In ko, this message translates to:
  /// **'프리랜서의 작업 노트'**
  String get loginSubTitle;

  /// No description provided for @setNickname.
  ///
  /// In ko, this message translates to:
  /// **'닉네임 설정'**
  String get setNickname;

  /// No description provided for @nicknameSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'나중에 언제든지 변경할 수 있습니다'**
  String get nicknameSubtitle;

  /// No description provided for @nicknameSpecialCharError.
  ///
  /// In ko, this message translates to:
  /// **'특수문자는 사용할 수 없어요'**
  String get nicknameSpecialCharError;

  /// No description provided for @deleteAccountConfirmQuestion.
  ///
  /// In ko, this message translates to:
  /// **'정말 탈퇴하시겠어요?'**
  String get deleteAccountConfirmQuestion;

  /// No description provided for @deleteAccountConfirmSubtext.
  ///
  /// In ko, this message translates to:
  /// **'아래 내용을 꼭 확인해주세요'**
  String get deleteAccountConfirmSubtext;

  /// No description provided for @deletedDataSectionTitle.
  ///
  /// In ko, this message translates to:
  /// **'삭제되는 개인정보 및 서비스 데이터'**
  String get deletedDataSectionTitle;

  /// No description provided for @deletedDataSocialLoginInfo.
  ///
  /// In ko, this message translates to:
  /// **'- 소셜 로그인 정보와 연동된 계정 식별 정보'**
  String get deletedDataSocialLoginInfo;

  /// No description provided for @deletedDataProjectAndWorkHistory.
  ///
  /// In ko, this message translates to:
  /// **'- 모든 프로젝트 및 작업 기록'**
  String get deletedDataProjectAndWorkHistory;

  /// No description provided for @deletedDataIncomeExpenseHistory.
  ///
  /// In ko, this message translates to:
  /// **'- 프로젝트 수입, 지출 기록 전체'**
  String get deletedDataIncomeExpenseHistory;

  /// No description provided for @deletedDataStatsAndCalendarHistory.
  ///
  /// In ko, this message translates to:
  /// **'- 통계 및 캘린더 기록'**
  String get deletedDataStatsAndCalendarHistory;

  /// No description provided for @deleteAccountNoticeTitle.
  ///
  /// In ko, this message translates to:
  /// **'주의사항'**
  String get deleteAccountNoticeTitle;

  /// No description provided for @deleteAccountNoticeIrreversible.
  ///
  /// In ko, this message translates to:
  /// **'- 삭제 된 데이터는 복구가 불가능합니다.'**
  String get deleteAccountNoticeIrreversible;

  /// No description provided for @deleteAccountNoticeNoCancelAndSupport.
  ///
  /// In ko, this message translates to:
  /// **'- 탈퇴 처리 후에는 취소가 불가능하며, 고객센터를 통한 복구 요청도 지원되지 않습니다.'**
  String get deleteAccountNoticeNoCancelAndSupport;

  /// No description provided for @deleteAccountAgreementCheckbox.
  ///
  /// In ko, this message translates to:
  /// **'유의사항을 모두 확인하였으며, 회원 탈퇴에 동의합니다.'**
  String get deleteAccountAgreementCheckbox;

  /// No description provided for @deleteAccountDialogMessage.
  ///
  /// In ko, this message translates to:
  /// **'탈퇴 시 모든 데이터가 삭제되며 복구할 수 없습니다.'**
  String get deleteAccountDialogMessage;

  /// No description provided for @empty_project_title.
  ///
  /// In ko, this message translates to:
  /// **'아직 프로젝트가 없어요'**
  String get empty_project_title;

  /// No description provided for @empty_project_description.
  ///
  /// In ko, this message translates to:
  /// **'새 프로젝트를 만들어 시작해보세요'**
  String get empty_project_description;
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
