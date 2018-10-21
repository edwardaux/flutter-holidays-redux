import 'package:holidays/model/fetchable.dart';
import 'package:holidays/networking/api.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/redux/holiday_list/holiday_list_actions.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createHolidayListMiddleware(API api) => [
      TypedMiddleware<AppState, FetchHolidaySummariesAction>(_fetchHolidaySummaries(api)),
    ];

Middleware<AppState> _fetchHolidaySummaries(API api) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    if (action is FetchHolidaySummariesAction) {
      try {
        final summaries = await api.fetchHolidaySummaries();

        action.completer.complete();
        store.dispatch(ReceivedHolidaySummariesAction(Fetchable.success(summaries)));
      } catch (e) {
        action.completer.completeError(e);
        store.dispatch(ReceivedHolidaySummariesAction(Fetchable.error(e)));
      }
    }
  };
}
