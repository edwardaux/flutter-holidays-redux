import 'dart:async';

import 'package:holidays/model/user.dart';
import 'package:holidays/networking/api.dart';
import 'package:holidays/redux/app/app_actions.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/redux/auth/auth_actions.dart';
import 'package:holidays/redux/auth/auth_middleware.dart';
import 'package:holidays/redux/holiday_list/holiday_list_actions.dart';
import 'package:holidays/redux/holiday_list/holiday_list_middleware.dart';
import 'package:holidays/routes.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createAppMiddleware(API api) {
  var list = List<Middleware<AppState>>();
  list.addAll(createHolidayListMiddleware(api));
  list.addAll(createAuthenticationMiddleware(api));
  list.add(_splashMiddleware());
  return list;
}

Middleware<AppState> _splashMiddleware() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    if (action is InitAction) {
      await Future.delayed(const Duration(seconds: 1));

      final isLoggedIn = true;
      final loggedInUser = isLoggedIn ? User(name: "john smith", userid: "john") : null;
      if (loggedInUser != null) {
        store.dispatch(LoginSuccessfulAction(user: loggedInUser));
        store.dispatch(FetchHolidaySummariesAction());
        globalNavigatorKey.currentState.pushReplacementNamed('/dashboard');
      } else {
        displayLoginScreen();
      }
    }
  };
}
