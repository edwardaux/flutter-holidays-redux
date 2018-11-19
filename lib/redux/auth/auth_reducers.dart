import 'package:holidays/redux/auth/auth_actions.dart';
import 'package:holidays/redux/auth/auth_state.dart';
import 'package:redux/redux.dart';

final authenticationReducer = combineReducers<AuthenticationState>([
  TypedReducer<AuthenticationState, LoginAction>(_login),
  TypedReducer<AuthenticationState, LoginSuccessfulAction>(_loginSuccessful),
  TypedReducer<AuthenticationState, LoginFailedAction>(_loginFailed),
  TypedReducer<AuthenticationState, LogoutAction>(_logout),
]);

AuthenticationState _login(AuthenticationState state, LoginAction action) {
  // no change required when initiating the login
  return state;
}

AuthenticationState _loginSuccessful(AuthenticationState state, LoginSuccessfulAction action) {
  return state.copyWith(loggedInUser: action.user);
}

AuthenticationState _loginFailed(AuthenticationState state, LoginFailedAction action) {
  // if we've failed, then we ensure they're logged out
  return state.copyWith(loggedInUser: null);
}

AuthenticationState _logout(AuthenticationState state, LogoutAction action) {
  return state.copyWith(loggedInUser: null);
}
