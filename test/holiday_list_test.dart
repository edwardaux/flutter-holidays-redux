import 'dart:async';

import 'package:holidays/model/fetchable.dart';
import 'package:holidays/model/holiday_summary.dart';
import 'package:holidays/redux/app/app_reducers.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/redux/holiday_list/holiday_list_actions.dart';
import 'package:holidays/redux/holiday_list/holiday_list_middleware.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

import 'mocks.dart';

void main() {
  MockAPI mockAPI;
  Store<AppState> store;

  setUp(() {
    mockAPI = MockAPI();

    store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      middleware: createHolidayListMiddleware(mockAPI),
    );
  });

  tearDown(() {});

  test('initial state', () {
    final state = AppState.initial();

    expect(state.holidaySummariesState.fetchableHolidaySummaries is FetchableSuccess<List<HolidaySummary>>, isTrue);
  });

  test('fetch holiday summaries', () async {
    when(mockAPI.fetchHolidaySummaries()).thenAnswer((_) {
      return Future.value([
        HolidaySummary(id: 1, name: 'test1'),
        HolidaySummary(id: 2, name: 'test2'),
        HolidaySummary(id: 3, name: 'test3'),
      ].toList());
    });

    // important that this is invoked using await, otherwise the
    // async calls deep in the middleware will not have time to
    // complete before the tests finish.
    // ignore: await_only_futures
    await store.dispatch(FetchHolidaySummariesAction());

    var list = store.state.holidaySummariesState.fetchableHolidaySummaries;
    if (list is FetchableSuccess<List<HolidaySummary>>) {
      expect(list.object[0].name, equals('test1'));
      expect(list.object[1].name, equals('test2'));
      expect(list.object[2].name, equals('test3'));
    } else {
      fail("Not expected type of FetchableSuccess<List<HolidaySummary>>");
    }
  });
}
