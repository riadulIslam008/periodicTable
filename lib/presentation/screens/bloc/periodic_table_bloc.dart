import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periodic_table/domain/repositories/periodic_table_repository.dart';
import 'package:periodic_table/presentation/screens/bloc/periodic_table_event.dart';
import 'package:periodic_table/presentation/screens/bloc/periodic_table_state.dart';

class PeriodicTableBloc extends Bloc<PeriodicTableEvent, PeriodicTableState> {
  final PeriodicTableRepository periodicTableRepository;


  PeriodicTableBloc(this.periodicTableRepository)
    : super(PeriodicTableLoadingState()) {
    on<PeriodicTableEvent>((event, emit) async {

      final response = await periodicTableRepository.getPeriodicTable();
      response.fold(
        (error) {
          emit(PeriodicTableErrorState(error: error.toString()));
        },
        (data) {
          emit(PeriodicTableSuccessState(periodicTableModel: data));
        },
      );
    });
  }
}
