import 'package:meta/meta.dart';

class HolidaySummary {
  final int id;
  final String name;

  HolidaySummary({
    @required this.id,
    @required this.name,
  });

  @override
  bool operator ==(Object other) => identical(this, other) || other is HolidaySummary && runtimeType == other.runtimeType && id == other.id && name == other.name;

  @override
  int get hashCode => id;
}
