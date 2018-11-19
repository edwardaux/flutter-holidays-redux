import 'package:holidays/model/fetchable.dart';
import 'package:holidays/redux/holiday_list/holiday_list_actions.dart';
import 'package:holidays/redux/holiday_list/holiday_list_state.dart';
import 'package:redux/redux.dart';

final holidaySummaryListReducer = combineReducers<HolidaySummariesState>([
  TypedReducer<HolidaySummariesState, FetchHolidaySummariesAction>(_fetchHolidaySummaries),
  TypedReducer<HolidaySummariesState, ReceivedHolidaySummariesAction>(_receivedHolidaySummaries),
]);

HolidaySummariesState _fetchHolidaySummaries(HolidaySummariesState state, FetchHolidaySummariesAction action) {
  return state.copyWith(fetchableHolidaySummaries: Fetchable.loading());
}

HolidaySummariesState _receivedHolidaySummaries(HolidaySummariesState state, ReceivedHolidaySummariesAction action) {
  return state.copyWith(fetchableHolidaySummaries: action.fetchableHolidaySummaries);
}
