import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:holidays/redux/app/app_actions.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        onInit: (Store<AppState> store) => store.dispatch(InitAction(context)),
        builder: (BuildContext context, Store<AppState> store) {
          return Scaffold(body: Center(child: Text('LOGO')));
        });
  }
}
