import 'dart:async';
import 'dart:math';

import 'package:holidays/model/fetchable.dart';
import 'package:holidays/model/holiday_summary.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/redux/holiday_list/holiday_list_actions.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createHolidayListMiddleware() => [
      TypedMiddleware<AppState, FetchHolidaySummariesAction>(_fetchHolidaySummaries),
    ];

Future _fetchHolidaySummaries(Store<AppState> store, FetchHolidaySummariesAction action, NextDispatcher next) async {
  next(action);

  if (action is FetchHolidaySummariesAction) {
    // we'd normally call out to a repository of some kind, but for now,
    // we'll just pause for a bit
    await Future.delayed(const Duration(seconds: 1));

    // let the UI know that we're back from the network
    action.completer.complete();

    // to let us build and test our retry logic, sometimes we'll return
    // some holiday summaries and sometimes we'll return an error
    if (Random().nextBool()) {
      final summary1 = HolidaySummary(id: 1, name: 'Europe');
      final summary2 = HolidaySummary(id: 2, name: 'America');

      next(ReceivedHolidaySummariesAction(Fetchable.success([summary1, summary2])));
    } else {
      next(ReceivedHolidaySummariesAction(Fetchable.error(StateError("Network timed out"))));
    }
  }
}
