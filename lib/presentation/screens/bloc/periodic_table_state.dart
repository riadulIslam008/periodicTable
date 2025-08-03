import 'package:periodic_table/data/models/periodic_table_model.dart';

sealed class PeriodicTableState {
}

final class PeriodicTableInitialState extends PeriodicTableState {}
final class PeriodicTableLoadingState extends PeriodicTableState {}
final class PeriodicTableSuccessState extends PeriodicTableState {
  final PeriodicTableModel periodicTableModel;

  PeriodicTableSuccessState({required this.periodicTableModel});
}
final class PeriodicTableErrorState extends PeriodicTableState {
  final String error;

  PeriodicTableErrorState({required this.error});
}
