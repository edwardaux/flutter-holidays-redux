import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:holidays/model/fetchable.dart';
import 'package:holidays/model/holiday.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class HolidayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) {
          final fetchableHoliday = store.state.holidaySummariesState.fetchableCurrentHoliday;
          if (fetchableHoliday is FetchableSuccess<Holiday>) {
            return _ViewModel(fetchableHoliday.object);
          } else {
            throw StateError('Unexpected type');
          }
        },
        builder: (BuildContext context, _ViewModel viewModel) => Scaffold(
              appBar: AppBar(
                title: Text(viewModel.pageTitle),
              ),
              body: Text(viewModel.name + '\n' + viewModel.details),
            ),
      );
}

@immutable
class _ViewModel {
  final String pageTitle;
  final String name;
  final String details;

  _ViewModel._({@required this.pageTitle, @required this.name, @required this.details});

  factory _ViewModel(Holiday holiday) {
    return _ViewModel._(pageTitle: 'Holiday', name: holiday.name, details: holiday.details);
  }
}
