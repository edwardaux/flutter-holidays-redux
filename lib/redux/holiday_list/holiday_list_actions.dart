import 'dart:async';

import 'package:holidays/model/fetchable.dart';
import 'package:holidays/model/holiday.dart';
import 'package:holidays/model/holiday_summary.dart';

class FetchHolidaySummariesAction {
  final Completer completer;
  FetchHolidaySummariesAction() : this.completer = Completer();
}

class ReceivedHolidaySummariesAction {
  final Fetchable<List<HolidaySummary>> fetchableHolidaySummaries;

  ReceivedHolidaySummariesAction(this.fetchableHolidaySummaries);
}

class FetchHolidayAction {
  final int id;
  final Completer completer;
  FetchHolidayAction(this.id) : this.completer = Completer();
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
