import 'package:flutter/material.dart';
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

// it annoys me that we have to pull this out into a separate function
// instead of being able to invoke `.pushReplacementNamed('/login')` like
// we can do with the rest of the routes. However, I haven't been able to
// find a way to push with the route name, yet still go modal.
void displayLoginScreen() {
  globalNavigatorKey.currentState.pushReplacement(new MaterialPageRoute<Null>(
    builder: (BuildContext context) {
      return LoginScreen();
    },
    fullscreenDialog: true,
  ));
}

Map<String, WidgetBuilder> getRoutes(BuildContext context, Store<AppState> store) {
  return {
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
