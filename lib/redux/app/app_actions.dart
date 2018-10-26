import 'dart:async';

import 'package:flutter/material.dart';

abstract class CompleterAction {
  final Completer completer = Completer();
}

class InitAction {
  final BuildContext context;

  InitAction(this.context);
}
