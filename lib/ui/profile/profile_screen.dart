import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:holidays/model/user.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) {
          final user = store.state.authenticationState.loggedInUser;
          if (user != null) {
            return _ViewModel(user);
          } else {
            throw StateError('Unexpected type');
          }
        },
        builder: (BuildContext context, _ViewModel viewModel) => Scaffold(
              appBar: AppBar(
                title: Text(viewModel.pageTitle),
              ),
              body: Text(viewModel.name),
            ),
      );
}

@immutable
class _ViewModel {
  final String pageTitle;
  final String name;

  _ViewModel._({@required this.pageTitle, @required this.name});

  factory _ViewModel(User user) {
    return _ViewModel._(pageTitle: 'Profile', name: user.name);
  }
}
