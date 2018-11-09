import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/routes.dart';
import 'package:holidays/ui/widgets/holidays_navigation_bar.dart';
import 'package:holidays/ui/widgets/tab_navigator.dart';
import 'package:redux/redux.dart';

class DashboardScreen extends StatefulWidget {
  @override
  DashboardScreenState createState() {
    return new DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  var currentTab = BottomTab.holidays;

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
      builder: (BuildContext context, Store<AppState> store) {
        return Scaffold(
          body: Stack(children: <Widget>[
            _buildOffstageNavigator(BottomTab.holidays, '/holidayList', holidaysTabNavigatorKey),
            _buildOffstageNavigator(BottomTab.profile, '/profile', profileTabNavigatorKey),
          ]),
          bottomNavigationBar: HolidaysNavigationBar(
            currentTab: currentTab,
            onSelectTab: _selectTab,
          ),
        );
      },
    );
  }

  Widget _buildOffstageNavigator(BottomTab bottomTab, String initialRoute, GlobalKey<NavigatorState> navigatorKey) {
    return Offstage(
      offstage: currentTab != bottomTab,
      child: TabNavigator(
        bottomTab: bottomTab,
        initialRoute: initialRoute,
        navigatorKey: navigatorKey,
      ),
    );
  }

  void _selectTab(BottomTab tab) {
    setState(() {
      currentTab = tab;
    });
  }
}
