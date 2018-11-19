import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/ui/holiday/holiday_screen.dart';
import 'package:holidays/ui/holiday_list/holiday_list_screen.dart';
import 'package:redux/redux.dart';

Map<String, WidgetBuilder> getRoutes(BuildContext context, Store<AppState> store) {
  return {
    '/': (BuildContext context) => new StoreBuilder<AppState>(
          builder: (context, store) {
            return HolidayListScreen();
          },
        ),
    '/holiday': (BuildContext context) => new StoreBuilder<AppState>(
          builder: (context, store) {
            return HolidayScreen();
          },
        ),
  };
}
