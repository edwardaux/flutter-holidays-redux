import 'package:holidays/model/fetchable.dart';
import 'package:holidays/redux/holiday_list/holiday_list_actions.dart';
import 'package:holidays/redux/holiday_list/holiday_list_state.dart';
import 'package:redux/redux.dart';

final holidaySummaryListReducer = combineReducers<HolidaySummariesState>([
  TypedReducer<HolidaySummariesState, FetchHolidaySummariesAction>(_fetchHolidaySummaries),
  TypedReducer<HolidaySummariesState, ReceivedHolidaySummariesAction>(_receivedHolidaySummaries),
  TypedReducer<HolidaySummariesState, FetchHolidayAction>(_fetchHoliday),
  TypedReducer<HolidaySummariesState, ReceivedHolidayAction>(_receivedHoliday),
  TypedReducer<HolidaySummariesState, SelectHolidayAction>(_selectHoliday),
]);

HolidaySummariesState _fetchHolidaySummaries(HolidaySummariesState state, FetchHolidaySummariesAction action) {
  return state.copyWith(fetchableHolidaySummaries: Fetchable.loading());
}

HolidaySummariesState _receivedHolidaySummaries(HolidaySummariesState state, ReceivedHolidaySummariesAction action) {
  return state.copyWith(fetchableHolidaySummaries: action.fetchableHolidaySummaries);
}

HolidaySummariesState _fetchHoliday(HolidaySummariesState state, FetchHolidayAction action) {
  return state.copyWith(fetchableCurrentHoliday: Fetchable.loading());
}

HolidaySummariesState _receivedHoliday(HolidaySummariesState state, ReceivedHolidayAction action) {
  return state.copyWith(fetchableCurrentHoliday: action.fetchableHoliday);
}

HolidaySummariesState _selectHoliday(HolidaySummariesState state, SelectHolidayAction action) {
  if (action.holiday == null) {
    return state.copyWith(fetchableCurrentHoliday: null);
  } else {
    return state.copyWith(fetchableCurrentHoliday: Fetchable.success(action.holiday));
  }
}
