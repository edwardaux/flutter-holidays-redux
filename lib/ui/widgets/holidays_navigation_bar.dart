import 'package:flutter/material.dart';

enum BottomTab { holidays, profile }

class HolidaysNavigationBar extends BottomNavigationBar {
  final BottomTab currentTab;
  final ValueChanged<BottomTab> onSelectTab;

  HolidaysNavigationBar({this.currentTab, this.onSelectTab})
      : super(
            currentIndex: currentTab.index,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Holidays')),
              BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
            ],
            onTap: (index) => onSelectTab(BottomTab.values[index]));
}
