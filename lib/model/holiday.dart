import 'package:meta/meta.dart';

class Holiday {
  final int id;
  final String name;
  final String details;

  Holiday({
    @required this.id,
    @required this.name,
    @required this.details,
  });

  @override
  bool operator ==(Object other) => identical(this, other) || other is Holiday && runtimeType == other.runtimeType && id == other.id && name == other.name && details == other.details;

  @override
  int get hashCode => id;
}
