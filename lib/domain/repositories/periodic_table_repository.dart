import 'package:dartz/dartz.dart';
import 'package:periodic_table/core/errors/fetch_data_error.dart';
import 'package:periodic_table/data/models/periodic_table_model.dart';

abstract class PeriodicTableRepository {
  Future<Either<AppError, PeriodicTableModel>> getPeriodicTable();
}
