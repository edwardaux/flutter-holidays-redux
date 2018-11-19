import 'dart:async';
import 'dart:math';

import 'package:holidays/model/holiday_summary.dart';

class API {
  Future<List<HolidaySummary>> fetchHolidaySummaries() async {
    // we'd normally call out to a network server of some kind, but for now,
    // we'll just pause for a bit
    await Future.delayed(const Duration(seconds: 1));

    // to let us build and test our retry logic, sometimes we'll return
    // some holiday summaries and sometimes we'll return an error
    if (Random().nextBool()) {
      final summary1 = HolidaySummary(id: 1, name: 'Europe');
      final summary2 = HolidaySummary(id: 2, name: 'America');

      return Future.value([summary1, summary2]);
    } else {
      throw StateError("Network timed out");
    }
  }
}
