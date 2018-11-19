import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/redux/holiday_list/holiday_list_reducers.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    holidaySummariesState: holidaySummaryListReducer(state.holidaySummariesState, action),
  );
}
