import 'package:holidays/model/user.dart';
import 'package:meta/meta.dart';

@immutable
class AuthenticationState {
  /// The logged in user (can be `null` if no-one is currently logged in)
  final User loggedInUser;

  /// An error message if there was a recent failed attemp
  final String errorMessage;

  AuthenticationState({
    @required this.loggedInUser,
    @required this.errorMessage,
  });

  factory AuthenticationState.initial() {
    return AuthenticationState(
      loggedInUser: null,
      errorMessage: "",
    );
  }

  AuthenticationState copyWith({
    User loggedInUser,
    String errorMessage,
  }) {
    return AuthenticationState(
      loggedInUser: loggedInUser ?? this.loggedInUser,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthenticationState && runtimeType == other.runtimeType && loggedInUser == other.loggedInUser;

  @override
  int get hashCode => loggedInUser.hashCode;
}
