import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/routes.dart';
import 'package:holidays/ui/widgets/holidays_navigation_bar.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final BottomTab bottomTab;
  final String initialRoute;

  TabNavigator({@required this.navigatorKey, @required this.bottomTab, @required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    var routes = getRoutes(context, store);

    return Navigator(
        key: navigatorKey,
        initialRoute: initialRoute,
        onGenerateRoute: (routeSettings) {
          // on the first pass through, the default route ('/') will be passed. however,
          // because this navigator is managing nested routes (and never the '/' route)
          // we need to ensure it only returns routes that are meaningful. so, in this
          // case, we just return the initial route that this navigator was provided with
          final routeName = (routeSettings.name == '/' ? initialRoute : routeSettings.name);
          return MaterialPageRoute(builder: (context) => routes[routeName](context));
        });
  }
}
