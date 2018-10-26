import 'package:holidays/networking/api.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/redux/auth/auth_actions.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createAuthenticationMiddleware(API api) => [
      TypedMiddleware<AppState, LoginAction>(_login(api)),
    ];

Middleware<AppState> _login(API api) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is LoginAction) {
      next(action);

      try {
        final user = await api.login(userid: action.userid, password: action.password);

        action.completer.complete();
        store.dispatch(LoginSuccessfulAction(user: user));
      } catch (e) {
        action.completer.completeError(e);
        store.dispatch(LoginFailedAction(error: e));
      }
    }
  };
}
