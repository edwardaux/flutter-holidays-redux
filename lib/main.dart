import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:holidays/networking/api.dart';
import 'package:holidays/redux/app/app_middleware.dart';
import 'package:holidays/redux/app/app_reducers.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/routes.dart';
import 'package:holidays/ui/splash/splash_screen.dart';
import 'package:redux/redux.dart';

void main() => runApp(HolidaysApp());

class HolidaysApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createAppMiddleware(API()),
  );

  @override
  Widget build(BuildContext context) => StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Holidays Demo',
          navigatorKey: globalNavigatorKey,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
          routes: getRoutes(context, store),
        ),
      );
}
