import 'package:holidays/model/fetchable.dart';
import 'package:holidays/model/holiday.dart';
import 'package:holidays/model/holiday_summary.dart';
import 'package:meta/meta.dart';

@immutable
class HolidaySummariesState {
  /// A list of visible holiday summaries. Not expected to be null.
  final Fetchable<List<HolidaySummary>> fetchableHolidaySummaries;

  /// The currently selected holiday. Can be null if no holiday is selected
  /// or we're not in the process of fetching one.
  final Fetchable<Holiday> fetchableCurrentHoliday;

  HolidaySummariesState({
    @required this.fetchableHolidaySummaries,
    @required this.fetchableCurrentHoliday,
  });

  factory HolidaySummariesState.initial() {
    return HolidaySummariesState(
      fetchableHolidaySummaries: Fetchable.success([]),
      fetchableCurrentHoliday: null,
    );
  }

  HolidaySummariesState copyWith({
    Fetchable<List<HolidaySummary>> fetchableHolidaySummaries,
    Fetchable<Holiday> fetchableCurrentHoliday,
  }) {
    return HolidaySummariesState(
      fetchableHolidaySummaries: fetchableHolidaySummaries ?? this.fetchableHolidaySummaries,
      fetchableCurrentHoliday: fetchableCurrentHoliday ?? this.fetchableCurrentHoliday,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is HolidaySummariesState && runtimeType == other.runtimeType && fetchableHolidaySummaries == other.fetchableHolidaySummaries && fetchableCurrentHoliday == other.fetchableCurrentHoliday;

  @override
  int get hashCode => fetchableHolidaySummaries.hashCode ^ fetchableCurrentHoliday.hashCode;
}
