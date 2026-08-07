// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => '프리로그';

  @override
  String get home => '홈';

  @override
  String get calendar => '캘린더';

  @override
  String get calculator => '계산기';

  @override
  String get profile => '내 정보';

  @override
  String get myProject => '내 작업';

  @override
  String projectStatus(int inProgress, int completed) {
    return '진행중 $inProgress  ⦁  완료 $completed';
  }

  @override
  String get all => '전체';

  @override
  String get inProgress => '진행중';

  @override
  String get onHold => '보류';

  @override
  String get completed => '완료';

  @override
  String get addProject => '작업 추가';

  @override
  String get addProjectSubtitle => '새로운 프리랜서 작업을 등록합니다';

  @override
  String get projectName => '작업명';

  @override
  String get projectNameHint => '작업명을 입력하세요';

  @override
  String get projectNameError => '작업명을 입력하세요';

  @override
  String get hourlyRate => '시급';

  @override
  String get hourlyRateHint => '시급을 입력하세요';

  @override
  String get hourlyRateError => '시급을 입력하세요';

  @override
  String get deadline => '마감일';

  @override
  String get deadlineHint => '연도-월-일';

  @override
  String get deadlineError => '마감일을 입력하세요';

  @override
  String get save => '저장';

  @override
  String get cancel => '취소';

  @override
  String get delete => '삭제';

  @override
  String get projectAdded => '프로젝트 추가 완료';

  @override
  String get editProject => '작업 수정';

  @override
  String get markAsCompleted => '완료로 변경';

  @override
  String get deleteProject => '삭제';

  @override
  String get deleteConfirm => '작업을 삭제할까요?';

  @override
  String get deleteWarning => '작업이 영구적으로 삭제됩니다.';

  @override
  String get noTimeEntries => '아직 기록된 작업이 없어요.';

  @override
  String get deleteRecordTitle => '기록을 삭제할까요?';

  @override
  String get deleteRecordMessage => '기록이 영구적으로 삭제됩니다.';

  @override
  String todoTab(int count) {
    return '할 일 ($count)';
  }

  @override
  String doneTab(int count) {
    return '완료 ($count)';
  }

  @override
  String get todos => '할 일';

  @override
  String get done => '완료';

  @override
  String get addTodo => '+ 추가';

  @override
  String get todosHint => '할 일 입력';

  @override
  String get editTodo => '할 일 수정';

  @override
  String get valieTodo => '내용을 입력하세요';

  @override
  String get date => '날짜';

  @override
  String get add => '추가';

  @override
  String get update => '수정';

  @override
  String get ok => '확인';

  @override
  String get editExpense => '지출 수정';

  @override
  String get editIncome => '수입 수정';

  @override
  String get costDetails => '원가 내역';

  @override
  String get paymentReceived => '받은 금액';

  @override
  String get item => '항목';

  @override
  String get itemHint => '항목명';

  @override
  String get valieItem => '항목을 입력하세요';

  @override
  String get amount => '금액';

  @override
  String get amountHint => '금액';

  @override
  String get valieAmount => '금액을 입력하세요';

  @override
  String get timeEntries => '작업 시간';

  @override
  String get timeEntry => '작업 시간';

  @override
  String get timeEntryTitle => '작업 시간';

  @override
  String get totalTimeEntries => '총 작업 시간';

  @override
  String get hours => '시간';

  @override
  String get records => '기록내역';

  @override
  String get editTimeEntry => '작업 시간 기록';

  @override
  String get enterHoursOrMinutes => '시간 또는 분을 입력해주세요';

  @override
  String get expense => '지출';

  @override
  String get income => '수익';

  @override
  String get calculation => '금액 산출';

  @override
  String get hourlyRateXHours => '시급 X 시간';

  @override
  String margin(int rate) {
    return '마진 ($rate%)';
  }

  @override
  String get marginRate => '마진율';

  @override
  String get sellingPrice => '판매가';

  @override
  String get settings => '설정';

  @override
  String get defaultHourlyRate => '기본 시급';

  @override
  String get defaultMargin => '기본 마진율';

  @override
  String get deadlineReminders => '마감일 알림';

  @override
  String get thisMonth => '이번달';

  @override
  String get allTime => '전체';

  @override
  String get activeProjects => '진행중 작업';

  @override
  String get totalHours => '총 작업 시간';

  @override
  String get revenue => '받은 수익';

  @override
  String get expenses => '지출';

  @override
  String get netProfit => '순수익';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get privacyPolicyCollectingInfo => '1. 수집하는 개인정보';

  @override
  String get privacyPolicyLoginInfo => '① 로그인 및 사용자 정보';

  @override
  String get privacyPolicySocialLoginInfo => '- 소셜 로그인 정보';

  @override
  String get privacyPolicyGoogleLoginInfo =>
      '   - Google 로그인: 이메일, 닉네임, 계정 고유 ID';

  @override
  String get privacyPolicyKakaoLoginInfo =>
      '   - Kakao 로그인: 이메일, 닉네임, 계정 고유 ID';

  @override
  String get privacyPolicyNicknameInfo => '- 사용자 닉네임 (앱 최초 실행 시 설정)';

  @override
  String get privacyPolicyServiceUsageInfo => '② 서비스 이용 정보';

  @override
  String get privacyPolicyProjectInfo => '- 프로젝트 정보';

  @override
  String get privacyPolicyTodoTimeInfo => '- 할 일 및 작업 시간 기록';

  @override
  String get privacyPolicyIncomeExpenseInfo => '- 수입 및 지출 내역';

  @override
  String get privacyPolicyCalendarStatsInfo => '- 캘린더 및 통계 데이터';

  @override
  String get privacyPolicyDefaultSettingsInfo => '- 기본 시급 및 기본 마진율 설정';

  @override
  String get privacyPolicyAdInfo => '③ 광고 관련 정보';

  @override
  String get privacyPolicyAdInfoDetail => '- 광고 플랫폼에서 자동 수집될 수 있음';

  @override
  String get privacyPolicyPurposeTitle => '2. 개인정보의 수집 및 이용 목적';

  @override
  String get privacyPolicyPurposeIntro => '수집한 개인정보는 다음 목적을 위해 사용됩니다.';

  @override
  String get privacyPolicyPurposeIdentity => '- 사용자 식별 및 로그인 기능 제공';

  @override
  String get privacyPolicyPurposeManagement =>
      '- 프로젝트, 작업 시간, 수입, 지출 관리 서비스 제공';

  @override
  String get privacyPolicyPurposeSync => '- 데이터 저장 및 기기 간 동기화';

  @override
  String get privacyPolicyPurposeAds => '- 광고 노출 및 서비스 개선';

  @override
  String get privacyPolicyStorageTitle => '3. 개인정보의 보관 처리';

  @override
  String get privacyPolicyStorageSupabase =>
      '- 본 서비스는 Supabase를 이용하여 개인정보를 저장 및 관리합니다.';

  @override
  String get privacyPolicyStoragePurpose =>
      '- 개인정보는 서비스 제공 목적 범위 내에서만 처리되며, 목적 외 사용은 하지 않습니다.';

  @override
  String get privacyPolicyRetentionTitle => '4. 개인정보 보관 기간';

  @override
  String get privacyPolicyRetentionDelete =>
      '- 이용자가 회원 탈퇴를 요청할 경우, 관련 법령에 따라 보관이 필요한 정보를 제외하고 개인정보는 즉시 삭제됩니다.';

  @override
  String get privacyPolicyRetentionLegal =>
      '- 단, 관계 법령에 따라 일정 기간 보관이 필요한 경우 해당 기간 동안 안전하게 보관됩니다.';

  @override
  String get privacyPolicyThirdPartyTitle => '5. 개인정보 제3자 제공';

  @override
  String get privacyPolicyThirdPartyNoShare =>
      '- 본 앱은 법령에 의한 경우를 제외하고 개인정보를 제3자에게 제공하지 않습니다.';

  @override
  String get privacyPolicyThirdPartyAdmob =>
      '- 광고 제공을 위해 Google AdMob SDK가 이용될 수 있으며, 이 과정에서 광고 식별자(AD ID) 등 일부 정보가 자동으로 처리될 수 있습니다.';

  @override
  String get privacyPolicyEntrustTitle => '6. 개인정보 처리 위탁';

  @override
  String get privacyPolicyEntrustIntro =>
      '서비스 제공을 위해 아래와 같은 외부 서비스를 이용할 수 있습니다.';

  @override
  String get privacyPolicyEntrustSupabase => '- Supabase (데이터 저장 및 백엔드 서비스)';

  @override
  String get privacyPolicyEntrustGoogleKakao => '- Google / Kakao (소셜 로그인)';

  @override
  String get privacyPolicyEntrustAdmob => '- Google AdMob (광고 제공)';

  @override
  String get privacyPolicyRightsTitle => '7. 이용자의 권리';

  @override
  String get privacyPolicyRightsDesc =>
      '이용자는 언제든지 본인의 개인정보 조회, 수정, 삭제(회원 탈퇴)를 요청할 수 있습니다.';

  @override
  String get privacyPolicyInquiryTitle => '8. 개인정보 보호 문의';

  @override
  String get privacyPolicyInquiryDesc => '개인정보와 관련한 문의사항은 아래 로 문의해 주세요.';

  @override
  String get privacyPolicyEmailLabel => '- 이메일:';

  @override
  String get reportBug => '오류 문의';

  @override
  String get signOut => '로그아웃';

  @override
  String get editSettings => '기본 설정 수정';

  @override
  String get marginRateHint => '마진율을 입력하세요';

  @override
  String get marginRateError => '마진율을 입력하세요';

  @override
  String get nickName => '이름';

  @override
  String get editNickname => '닉네임 변경';

  @override
  String get nicknameHint => '새로운 닉네임을 입력하세요';

  @override
  String get nicknameError => '닉네임을 입력하세요';

  @override
  String get email => '이메일';

  @override
  String get userFailled => '유저 정보를 불러오지 못했습니다.';

  @override
  String get fetchFailed => ' 데이터를 불러오지 못했습니다.';

  @override
  String get saveFailed => '요청에 실패하였습니다. 다시 시도해주세요';

  @override
  String get checkInternet => '인터넷 연결을 확인해주세요.';

  @override
  String get unknownError => '알 수 없는 에러가 발생하였습니다.';

  @override
  String get today => '오늘';

  @override
  String get noRecord => '기록이 없어요.';

  @override
  String get priceCalculator => '가격 계산기';

  @override
  String get quickEstimate => '즉석 금액 산출';

  @override
  String get app => '앱 정보';

  @override
  String get account => '계정 관리';

  @override
  String get settingsData => '데이터 수집 및 이용 안내';

  @override
  String get settingsBug => '버그 신고 및 문의';

  @override
  String get deleteAccount => '회원탈퇴';

  @override
  String get settingsDelete => '모든 데이터 영구 삭제';

  @override
  String get authError => '로그인에 실패했습니다. 다시 시도해주세요';

  @override
  String get loginKakao => '카카오 계정으로 계속하기';

  @override
  String get loginGoogle => '구글 계정으로 계속하기';

  @override
  String get loginSubTitle => '프리랜서의 작업 노트';

  @override
  String get setNickname => '닉네임 설정';

  @override
  String get nicknameSubtitle => '나중에 언제든지 변경할 수 있습니다';

  @override
  String get nicknameSpecialCharError => '특수문자는 사용할 수 없어요';

  @override
  String get deleteAccountConfirmQuestion => '정말 탈퇴하시겠어요?';

  @override
  String get deleteAccountConfirmSubtext => '아래 내용을 꼭 확인해주세요';

  @override
  String get deletedDataSectionTitle => '삭제되는 개인정보 및 서비스 데이터';

  @override
  String get deletedDataSocialLoginInfo => '- 소셜 로그인 정보와 연동된 계정 식별 정보';

  @override
  String get deletedDataProjectAndWorkHistory => '- 모든 프로젝트 및 작업 기록';

  @override
  String get deletedDataIncomeExpenseHistory => '- 프로젝트 수입, 지출 기록 전체';

  @override
  String get deletedDataStatsAndCalendarHistory => '- 통계 및 캘린더 기록';

  @override
  String get deleteAccountNoticeTitle => '주의사항';

  @override
  String get deleteAccountNoticeIrreversible => '- 삭제 된 데이터는 복구가 불가능합니다.';

  @override
  String get deleteAccountNoticeNoCancelAndSupport =>
      '- 탈퇴 처리 후에는 취소가 불가능하며, 고객센터를 통한 복구 요청도 지원되지 않습니다.';

  @override
  String get deleteAccountAgreementCheckbox => '유의사항을 모두 확인하였으며, 회원 탈퇴에 동의합니다.';

  @override
  String get deleteAccountDialogMessage => '탈퇴 시 모든 데이터가 삭제되며 복구할 수 없습니다.';
}
