import 'dart:async';

import 'package:holidays/model/fetchable.dart';
import 'package:holidays/model/holiday_summary.dart';

class FetchHolidaySummariesAction {
  final Completer completer;
  FetchHolidaySummariesAction() : this.completer = Completer();
}

class ReceivedHolidaySummariesAction {
  final Fetchable<List<HolidaySummary>> fetchableHolidaySummaries;

  ReceivedHolidaySummariesAction(this.fetchableHolidaySummaries);
}
