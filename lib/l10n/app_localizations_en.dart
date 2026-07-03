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
  String get deadlineError => '    Please select a deadline';

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
  String get settings => 'Settings';

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
}
