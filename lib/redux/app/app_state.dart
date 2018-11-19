import 'package:holidays/redux/auth/auth_state.dart';
import 'package:holidays/redux/holiday_list/holiday_list_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final HolidaySummariesState holidaySummariesState;
  final AuthenticationState authenticationState;

  AppState({
    @required this.holidaySummariesState,
    @required this.authenticationState,
  });

  factory AppState.initial() {
    return AppState(
      holidaySummariesState: HolidaySummariesState.initial(),
      authenticationState: AuthenticationState.initial(),
    );
  }
}
