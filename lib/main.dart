import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:holidays/redux/app/app_reducers.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/redux/holiday_list/holiday_list_actions.dart';
import 'package:holidays/redux/holiday_list/holiday_list_middleware.dart';
import 'package:holidays/ui/holiday_list/holiday_list_screen.dart';
import 'package:redux/redux.dart';

void main() => runApp(HolidaysApp());

class HolidaysApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createHolidayListMiddleware(),
  );

  HolidaysApp() {
    // first thing we do when we launch is trigger a fetch of holiday summaries
    store.dispatch(FetchHolidaySummariesAction());
  }

  @override
  Widget build(BuildContext context) => StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Holidays Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HolidayListScreen(),
        ),
      );
}
