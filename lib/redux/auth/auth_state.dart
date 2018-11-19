import 'package:holidays/model/user.dart';
import 'package:meta/meta.dart';

@immutable
class AuthenticationState {
  /// The logged in user (can be `null` if no-one is currently logged in)
  final User loggedInUser;

  AuthenticationState({
    @required this.loggedInUser,
  });

  factory AuthenticationState.initial() {
    return AuthenticationState(
      loggedInUser: null,
    );
  }

  AuthenticationState copyWith({
    User loggedInUser,
  }) {
    return AuthenticationState(
      loggedInUser: loggedInUser ?? this.loggedInUser,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthenticationState && runtimeType == other.runtimeType && loggedInUser == other.loggedInUser;

  @override
  int get hashCode => loggedInUser.hashCode;
}
