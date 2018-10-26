import 'package:meta/meta.dart';

class User {
  final String userid;
  final String name;

  User({@required this.userid, @required this.name});

  @override
  bool operator ==(Object other) => identical(this, other) || other is User && runtimeType == other.runtimeType && userid == other.userid && name == other.name;

  @override
  int get hashCode => userid.hashCode;
}
