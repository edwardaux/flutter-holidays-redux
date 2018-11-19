import 'package:holidays/model/fetchable.dart';
import 'package:holidays/model/holiday_summary.dart';
import 'package:meta/meta.dart';

@immutable
class HolidaySummariesState {
  /// A list of visible holiday summaries. Not expected to be null.
  final Fetchable<List<HolidaySummary>> fetchableHolidaySummaries;

  HolidaySummariesState({@required this.fetchableHolidaySummaries});

  factory HolidaySummariesState.initial() {
    return HolidaySummariesState(
      fetchableHolidaySummaries: Fetchable.success([]),
    );
  }

  HolidaySummariesState copyWith({
    Fetchable<List<HolidaySummary>> fetchableHolidaySummaries,
  }) {
    return HolidaySummariesState(
      fetchableHolidaySummaries: fetchableHolidaySummaries ?? this.fetchableHolidaySummaries,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is HolidaySummariesState && runtimeType == other.runtimeType && fetchableHolidaySummaries == other.fetchableHolidaySummaries;

  @override
  int get hashCode => fetchableHolidaySummaries.hashCode;
}
