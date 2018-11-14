import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:holidays/model/fetchable.dart';
import 'package:holidays/model/holiday_summary.dart';
import 'package:holidays/redux/app/app_state.dart';
import 'package:holidays/redux/auth/auth_actions.dart';
import 'package:holidays/redux/holiday_list/holiday_list_actions.dart';
import 'package:holidays/redux/holiday_list/holiday_list_state.dart';
import 'package:holidays/routes.dart';
import 'package:holidays/ui/widgets/spinner.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class HolidayListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.create(store.state.holidaySummariesState),
        builder: (BuildContext context, _ViewModel viewModel) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(viewModel.pageTitle),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.backspace),
                    onPressed: () {
                      StoreProvider.of<AppState>(context).dispatch(LogoutAction());
                    },
                  ),
                ],
              ),
              body: viewModel.isLoadingHoliday ? Spinner() : _createRefreshWidget(context, viewModel),
            ),
      );

  // returns a pull-to-refresh widget that wraps a list of children
  Widget _createRefreshWidget(BuildContext context, _ViewModel viewModel) {
    final refreshFunction = () {
      final refreshAction = FetchHolidaySummariesAction();
      final store = StoreProvider.of<AppState>(context);
      store.dispatch(refreshAction);
      return refreshAction.completer.future;
    };
    return RefreshIndicator(child: ListView(children: _createBodyWidgets(context, viewModel)), onRefresh: refreshFunction);
  }

  // returns a collection of widgets to be displayed in a list view. for the loading/error
  // states, it will be a list with only one widget in it.
  List<Widget> _createBodyWidgets(BuildContext context, _ViewModel viewModel) {
    final summaryViewModels = viewModel.fetchableSummaryViewModels;
    if (summaryViewModels is FetchableLoading) {
      return [Text('Loading...')];
    } else if (summaryViewModels is FetchableSuccess<List<_SummaryViewModel>>) {
      return summaryViewModels.object.map((_SummaryViewModel summaryViewModel) => _createHolidaySummaryWidget(context, summaryViewModel)).toList();
    } else if (summaryViewModels is FetchableError<List<_SummaryViewModel>>) {
      final message = summaryViewModels.error.toString();
      return [Text('Error: $message')];
    } else {
      throw StateError('Unexpected type');
    }
  }

  Widget _createHolidaySummaryWidget(BuildContext context, _SummaryViewModel summaryViewModel) {
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [Text(summaryViewModel.title)]),
        ),
        onTap: () {
          final store = StoreProvider.of<AppState>(context);
          navigateToHoliday(id: summaryViewModel.id, context: context, store: store);
        });
  }
}

@immutable
class _ViewModel {
  // the title for the page
  final String pageTitle;
  // a collection of view models for each summary
  final Fetchable<List<_SummaryViewModel>> fetchableSummaryViewModels;
  // are we currently fetching a holiday
  final bool isLoadingHoliday;

  _ViewModel._({@required this.pageTitle, @required this.fetchableSummaryViewModels, @required this.isLoadingHoliday});

  factory _ViewModel.create(HolidaySummariesState holidaySummariesState, {Function refreshCallback}) {
    final fetchableSummaryViewModels = holidaySummariesState.fetchableHolidaySummaries.map((List<HolidaySummary> summaries) {
      return summaries.map((HolidaySummary summary) => _SummaryViewModel(summary)).toList();
    });
    final loadingHoliday = holidaySummariesState.fetchableCurrentHoliday is FetchableLoading;
    return _ViewModel._(pageTitle: 'Holidays', fetchableSummaryViewModels: fetchableSummaryViewModels, isLoadingHoliday: loadingHoliday);
  }
}

@immutable
class _SummaryViewModel {
  final int id;
  final String title;

  _SummaryViewModel._({@required this.id, @required this.title});

  factory _SummaryViewModel(HolidaySummary summary) {
    return _SummaryViewModel._(id: summary.id, title: 'Destination: ' + summary.name);
  }
}
