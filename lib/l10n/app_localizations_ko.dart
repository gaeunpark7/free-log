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
}
