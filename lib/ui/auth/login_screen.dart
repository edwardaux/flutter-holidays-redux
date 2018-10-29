import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/redux/auth/auth_actions.dart';
import 'package:redux/redux.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _useridController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store: store),
      builder: (BuildContext context, _ViewModel viewModel) => Scaffold(
            appBar: AppBar(title: Text(viewModel.pageTitle)),
            body: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _useridController,
                    decoration: InputDecoration(labelText: 'Userid'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  RaisedButton(
                    child: Text('Login'),
                    onPressed: () {
                      viewModel.performLogin(
                        userid: _useridController.text,
                        password: _passwordController.text,
                      );
                    },
                  ),
                  Text(viewModel.errorMessage)
                ],
              ),
            ),
          ));
}

class _ViewModel {
  // the title for the page
  final String pageTitle;
  // the error message (can be empty)
  final String errorMessage;
  // function that will be called when a login needs to be performed
  final Function({String userid, String password}) performLogin;

  _ViewModel._({@required this.pageTitle, @required this.errorMessage, @required this.performLogin});

  factory _ViewModel.create({Store<AppState> store}) {
    return _ViewModel._(
        pageTitle: 'Login',
        errorMessage: store.state.authenticationState.errorMessage,
        performLogin: ({String userid, String password}) {
          store.dispatch(LoginAction(userid: userid, password: password));
        });
  }
}
