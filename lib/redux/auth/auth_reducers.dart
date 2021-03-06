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
  return state.copyWith(errorMessage: "");
}

AuthenticationState _loginSuccessful(AuthenticationState state, LoginSuccessfulAction action) {
  return state.copyWith(loggedInUser: action.user, errorMessage: "");
}

AuthenticationState _loginFailed(AuthenticationState state, LoginFailedAction action) {
  // if we've failed, then we ensure they're logged out
  return state.copyWith(loggedInUser: null, errorMessage: action.error.toString());
}

AuthenticationState _logout(AuthenticationState state, LogoutAction action) {
  return state.copyWith(loggedInUser: null, errorMessage: "");
}
