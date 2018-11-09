import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/redux/holiday_list/holiday_list_actions.dart';
import 'package:holidays/ui/auth/login_screen.dart';
import 'package:holidays/ui/dashboard/dashboard_screen.dart';
import 'package:holidays/ui/holiday/holiday_screen.dart';
import 'package:holidays/ui/holiday_list/holiday_list_screen.dart';
import 'package:holidays/ui/profile/profile_screen.dart';
import 'package:redux/redux.dart';

final GlobalKey<NavigatorState> globalNavigatorKey = new GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> holidaysTabNavigatorKey = new GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> profileTabNavigatorKey = new GlobalKey<NavigatorState>();

void navigateToHoliday({@required int id, @required BuildContext context, @required Store<AppState> store}) {
  final action = FetchHolidayAction(id);
  store.dispatch(action);
  action.completer.future.then((result) {
    Navigator.of(context).pushNamed('/holiday');
  });
}

Map<String, WidgetBuilder> getRoutes(BuildContext context, Store<AppState> store) {
  return {
    '/login': (BuildContext context) => new StoreBuilder<AppState>(
          builder: (context, store) {
            return LoginScreen();
          },
        ),
    '/dashboard': (BuildContext context) => new StoreBuilder<AppState>(
          builder: (context, store) {
            return DashboardScreen();
          },
        ),
    '/holidayList': (BuildContext context) => new StoreBuilder<AppState>(
          builder: (context, store) {
            return HolidayListScreen();
          },
        ),
    '/holiday': (BuildContext context) => new StoreBuilder<AppState>(
          builder: (context, store) {
            return HolidayScreen();
          },
        ),
    '/profile': (BuildContext context) => new StoreBuilder<AppState>(
          builder: (context, store) {
            return ProfileScreen();
          },
        ),
  };
}
