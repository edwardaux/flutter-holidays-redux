import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/ui/holiday_list/holiday_list_screen.dart';
import 'package:holidays/ui/widgets/holidays_navigation_bar.dart';
import 'package:redux/redux.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
      builder: (BuildContext context, Store<AppState> store) {
        return Scaffold(
          body: Stack(children: <Widget>[
            HolidayListScreen(),
          ]),
          bottomNavigationBar: HolidaysNavigationBar(
            currentTab: BottomTab.holidays,
            onSelectTab: _selectTab,
          ),
        );
      },
    );
  }

  void _selectTab(BottomTab tab) {
    print('Selected $tab');
  }
}
