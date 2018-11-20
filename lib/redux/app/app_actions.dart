import 'dart:async';

abstract class CompleterAction {
  final Completer completer = Completer();
}

class InitAction {}
