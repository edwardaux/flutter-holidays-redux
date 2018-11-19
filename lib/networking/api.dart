import 'dart:async';
import 'dart:math';

import 'package:holidays/model/holiday.dart';
import 'package:holidays/model/holiday_summary.dart';
import 'package:holidays/model/user.dart';
import 'package:meta/meta.dart';

class API {
  Future<User> login({@required String userid, @required String password}) async {
    // we'd normally call out to a network server of some kind, but for now,
    // we'll just pause for a bit
    await Future.delayed(const Duration(seconds: 1));

    if (userid == password) {
      return Future.value(User(userid: userid, name: '$userid $userid'));
    } else {
      throw StateError('Invalid userid and password');
    }
  }

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

  Future<Holiday> fetchHoliday(int id) async {
    // we'd normally call out to a network server of some kind, but for now,
    // we'll just pause for a bit
    await Future.delayed(const Duration(seconds: 1));

    if (id == 1) {
      return Future.value(Holiday(id: id, name: "Europe", details: "This is a European holiday"));
    } else {
      return Future.value(Holiday(id: id, name: "America", details: "This is an American holiday"));
    }
  }
}
