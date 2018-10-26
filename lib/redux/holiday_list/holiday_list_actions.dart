import 'package:holidays/model/fetchable.dart';
import 'package:holidays/model/holiday.dart';
import 'package:holidays/model/holiday_summary.dart';
import 'package:holidays/redux/app/app_actions.dart';

class FetchHolidaySummariesAction extends CompleterAction {
  FetchHolidaySummariesAction();
}

class ReceivedHolidaySummariesAction {
  final Fetchable<List<HolidaySummary>> fetchableHolidaySummaries;

  ReceivedHolidaySummariesAction(this.fetchableHolidaySummaries);
}

class FetchHolidayAction extends CompleterAction {
  final int id;
  FetchHolidayAction(this.id);
}

class ReceivedHolidayAction {
  final Fetchable<Holiday> fetchableHoliday;

  ReceivedHolidayAction(this.fetchableHoliday);
}

class SelectHolidayAction {
  /// Select a specific holiday. Can be null if the action is to deselect.
  final Holiday holiday;

  SelectHolidayAction(this.holiday);
}
