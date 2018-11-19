import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Spinner extends StatelessWidget {
  Spinner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
