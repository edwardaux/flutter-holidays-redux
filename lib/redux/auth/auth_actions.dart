import 'package:holidays/model/user.dart';
import 'package:holidays/redux/app/app_actions.dart';
import 'package:meta/meta.dart';

class LoginAction extends CompleterAction {
  final String userid;
  final String password;
  LoginAction({@required this.userid, @required this.password});
}

class LoginSuccessfulAction {
  final User user;
  LoginSuccessfulAction({@required this.user});
}

class LoginFailedAction {
  final Error error;
  LoginFailedAction({@required this.error});
}

class LogoutAction {}
