import 'package:holidays/redux/holiday_list/holiday_list_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final HolidaySummariesState holidaySummariesState;

  AppState({@required this.holidaySummariesState});

  factory AppState.initial() {
    return AppState(
      holidaySummariesState: HolidaySummariesState.initial(),
    );
  }
}
