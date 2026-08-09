// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Freelog';

  @override
  String get home => 'Home';

  @override
  String get calendar => 'Calendar';

  @override
  String get calculator => 'Calculator';

  @override
  String get profile => 'Profile';

  @override
  String get myProject => 'My Projects';

  @override
  String projectStatus(int inProgress, int completed) {
    return 'In Progress $inProgress  ⦁  Done $completed';
  }

  @override
  String get all => 'All';

  @override
  String get inProgress => 'In Progress';

  @override
  String get onHold => 'On Hold';

  @override
  String get completed => 'Completed';

  @override
  String get addProject => 'Add Project';

  @override
  String get addProjectSubtitle => 'Register a new freelance project';

  @override
  String get projectName => 'Project Name';

  @override
  String get projectNameHint => 'Enter project name';

  @override
  String get projectNameError => 'Please enter a project name';

  @override
  String get hourlyRate => 'Hourly Rate';

  @override
  String get hourlyRateHint => 'Enter hourly rate';

  @override
  String get hourlyRateError => 'Please enter an hourly rate';

  @override
  String get deadline => 'Deadline';

  @override
  String get deadlineHint => 'YYYY-MM-DD';

  @override
  String get deadlineError => 'Please select a deadline';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get projectAdded => 'Project Added';

  @override
  String get editProject => 'Edit Project';

  @override
  String get markAsCompleted => 'Mark as Completed';

  @override
  String get deleteProject => 'Delete';

  @override
  String get deleteConfirm => 'Delete this project?';

  @override
  String get deleteWarning => 'This cannot be undone.';

  @override
  String get noTimeEntries => 'No time entries yet';

  @override
  String get deleteRecordTitle => 'Delete this record?';

  @override
  String get deleteRecordMessage => 'This record will be permanently deleted.';

  @override
  String todoTab(int count) {
    return 'Todo ($count)';
  }

  @override
  String doneTab(int count) {
    return 'Done ($count)';
  }

  @override
  String get todos => 'To Do';

  @override
  String get done => 'Done';

  @override
  String get addTodo => '+ Add';

  @override
  String get todosHint => 'Enter task name';

  @override
  String get editTodo => 'Edit task';

  @override
  String get valieTodo => 'Please enter a task name.';

  @override
  String get date => 'Date';

  @override
  String get add => 'Add';

  @override
  String get update => 'Update';

  @override
  String get ok => 'OK';

  @override
  String get editExpense => 'Edit Expense';

  @override
  String get editIncome => 'Edit Income';

  @override
  String get costDetails => 'Cost Details';

  @override
  String get paymentReceived => 'Payment Received';

  @override
  String get item => 'Item';

  @override
  String get itemHint => 'Enter item name';

  @override
  String get valieItem => 'Please enter an item name.';

  @override
  String get amount => 'Amount';

  @override
  String get amountHint => 'Enter amount';

  @override
  String get valieAmount => 'Please enter an amount.';

  @override
  String get timeEntries => 'Time Entries';

  @override
  String get timeEntry => 'Time Entry';

  @override
  String get timeEntryTitle => 'Work Hours';

  @override
  String get totalTimeEntries => 'Total Work Hours';

  @override
  String get hours => 'Hours';

  @override
  String get records => 'Records';

  @override
  String get editTimeEntry => 'Edit Time Entry';

  @override
  String get enterHoursOrMinutes => 'Please enter hours or minutes.';

  @override
  String get expense => 'Expenses';

  @override
  String get income => 'Income';

  @override
  String get calculation => 'Price Calculation';

  @override
  String get hourlyRateXHours => 'Rate × Hours';

  @override
  String margin(int rate) {
    return 'Margin ($rate%)';
  }

  @override
  String get marginRate => 'Margin Rate';

  @override
  String get sellingPrice => 'Selling Price';

  @override
  String get settingsBasic => 'Settings';

  @override
  String get defaultHourlyRate => 'Default Hourly Rate';

  @override
  String get defaultMargin => 'Default Margin Rate';

  @override
  String get deadlineReminders => 'Deadline Reminders';

  @override
  String get thisMonth => 'This Month';

  @override
  String get allTime => 'All Time';

  @override
  String get activeProjects => 'Active Projects';

  @override
  String get totalHours => 'Total Hours';

  @override
  String get revenue => 'Revenue';

  @override
  String get expenses => 'Expenses';

  @override
  String get netProfit => 'Net Profit';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicyCollectingInfo => '1. Personal Information Collected';

  @override
  String get privacyPolicyLoginInfo => '① Login and user information';

  @override
  String get privacyPolicySocialLoginInfo => '- Social login information';

  @override
  String get privacyPolicyGoogleLoginInfo =>
      '   - Google Login: email, nickname, account ID';

  @override
  String get privacyPolicyKakaoLoginInfo =>
      '   - Kakao Login: email, nickname, account ID';

  @override
  String get privacyPolicyNicknameInfo =>
      '- User nickname (set on first launch)';

  @override
  String get privacyPolicyServiceUsageInfo => '② Service User information';

  @override
  String get privacyPolicyProjectInfo => '- Project information';

  @override
  String get privacyPolicyTodoTimeInfo => '- To-do items and work time records';

  @override
  String get privacyPolicyIncomeExpenseInfo => '- Income and expense records';

  @override
  String get privacyPolicyCalendarStatsInfo => '- Calendar and statistics data';

  @override
  String get privacyPolicyDefaultSettingsInfo =>
      '- Default hourly rate and margin rate settings';

  @override
  String get privacyPolicyAdInfo => '③ Advertising-related information';

  @override
  String get privacyPolicyAdInfoDetail =>
      '- May be collected automatically by the advertising platform';

  @override
  String get privacyPolicyPurposeTitle =>
      '2. Purpose of Collection and Use of Personal Information';

  @override
  String get privacyPolicyPurposeIntro =>
      'The collected personal information is used for the following purposes.';

  @override
  String get privacyPolicyPurposeIdentity =>
      '- User identification and login functionality';

  @override
  String get privacyPolicyPurposeManagement =>
      '- Providing project, work time, income, and expense management services';

  @override
  String get privacyPolicyPurposeSync =>
      '- Data storage and synchronization across devices';

  @override
  String get privacyPolicyPurposeAds => '- Ad delivery and service improvement';

  @override
  String get privacyPolicyStorageTitle =>
      '3. Storage and Handling of Personal Information';

  @override
  String get privacyPolicyStorageSupabase =>
      '- This service uses Supabase to store and manage personal information.';

  @override
  String get privacyPolicyStoragePurpose =>
      '- Personal information is processed only for the purpose of providing the service and is not used for any other purpose.';

  @override
  String get privacyPolicyRetentionTitle =>
      '4. Personal Information Retention Period';

  @override
  String get privacyPolicyRetentionDelete =>
      '- If a user requests account deletion, personal information will be deleted immediately except for information that must be retained under applicable laws.';

  @override
  String get privacyPolicyRetentionLegal =>
      '- However, if retention is required by law, the information will be safely stored for the required period.';

  @override
  String get privacyPolicyThirdPartyTitle =>
      '5. Provision of Personal Information to Third Parties';

  @override
  String get privacyPolicyThirdPartyNoShare =>
      '- This app does not provide personal information to third parties except where required by law.';

  @override
  String get privacyPolicyThirdPartyAdmob =>
      '- Google AdMob SDK may be used to deliver advertisements, and certain information, such as advertising identifiers (AD ID), may be processed automatically.';

  @override
  String get privacyPolicyEntrustTitle =>
      '6. Entrustment of Personal Information Processing';

  @override
  String get privacyPolicyEntrustIntro =>
      'The following external services may be used to provide the service.';

  @override
  String get privacyPolicyEntrustSupabase =>
      '- Supabase (data storage and backend services)';

  @override
  String get privacyPolicyEntrustGoogleKakao =>
      '- Google / Kakao (social login)';

  @override
  String get privacyPolicyEntrustAdmob => '- Google AdMob (ad delivery)';

  @override
  String get privacyPolicyRightsTitle => '7. User Rights';

  @override
  String get privacyPolicyRightsDesc =>
      'Users may request access, correction, or deletion of their personal information (account deletion) at any time.';

  @override
  String get privacyPolicyInquiryTitle => '8. Privacy Inquiry';

  @override
  String get privacyPolicyInquiryDesc =>
      'For any privacy-related inquiries, please contact us below.';

  @override
  String get privacyPolicyEmailLabel => '- Email:';

  @override
  String get reportBug => 'Report a Bug';

  @override
  String get signOut => 'Sign Out';

  @override
  String get editSettings => 'Edit Settings';

  @override
  String get marginRateHint => 'Enter Margin Rate';

  @override
  String get marginRateError => 'Please enter a margin rate';

  @override
  String get nickName => 'Nickname';

  @override
  String get editNickname => 'Edit Nickname';

  @override
  String get nicknameHint => 'Enter Nickname';

  @override
  String get nicknameError => 'Please enter a nickname';

  @override
  String get email => 'Email';

  @override
  String get userFailled => 'Failed to load user information.';

  @override
  String get fetchFailed => 'ailed to load data';

  @override
  String get saveFailed => 'Request failed. Please try again';

  @override
  String get checkInternet => 'Please check your internet connection.';

  @override
  String get unknownError => 'An unknown error occurred.';

  @override
  String get today => 'Today';

  @override
  String get noRecord => 'No records found.';

  @override
  String get priceCalculator => 'Price Calculator';

  @override
  String get quickEstimate => 'Quick Estimate';

  @override
  String get app => 'App';

  @override
  String get account => 'Account';

  @override
  String get settings => 'Settings';

  @override
  String get settingsData => 'How we collect and use your data';

  @override
  String get settingsBug => 'Report bugs or contact support';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get settingsDelete => 'Permanently delete all data';

  @override
  String get authError => 'Login failed. Please try again';

  @override
  String get loginKakao => 'Sign in with Kakao';

  @override
  String get loginGoogle => 'Sign in with Google';

  @override
  String get loginSubTitle => 'Your freelance work log';

  @override
  String get setNickname => 'Set Nickname';

  @override
  String get nicknameSubtitle => 'You can change this anytime';

  @override
  String get nicknameSpecialCharError => 'Special characters are not allowed';

  @override
  String get deleteAccountConfirmQuestion =>
      'Are you sure you want to delete your account?';

  @override
  String get deleteAccountConfirmSubtext =>
      'Please make sure to read the details below.';

  @override
  String get deletedDataSectionTitle =>
      'Personal Information & Service Data to be Deleted';

  @override
  String get deletedDataSocialLoginInfo =>
      '- Account identifiers linked with social login information';

  @override
  String get deletedDataProjectAndWorkHistory =>
      '- All project and work records';

  @override
  String get deletedDataIncomeExpenseHistory =>
      '- All project income and expense records';

  @override
  String get deletedDataStatsAndCalendarHistory =>
      '- Statistics and calendar records';

  @override
  String get deleteAccountNoticeTitle => 'Notice';

  @override
  String get deleteAccountNoticeIrreversible =>
      '- Deleted data cannot be recovered.';

  @override
  String get deleteAccountNoticeNoCancelAndSupport =>
      '- Account deletion cannot be canceled once processed, and recovery requests through Customer Support are not supported.';

  @override
  String get deleteAccountAgreementCheckbox =>
      'I have read all the notice items and agree to delete my account.';

  @override
  String get deleteAccountDialogMessage =>
      'Upon deleting your account, all data will be erased and cannot be restored.';

  @override
  String get empty_project_title => 'No projects yet';

  @override
  String get empty_project_description =>
      'Create your first project to get started';

  @override
  String get feedbackFormOpenFailed => 'Unable to open the link.';

  @override
  String get feedbackFormError => 'An error occurred while opening the link.';

  @override
  String get completedTasks => 'Completed Tasks';
}
