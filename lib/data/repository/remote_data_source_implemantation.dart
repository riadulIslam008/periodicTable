import 'package:dartz/dartz.dart';
import 'package:periodic_table/core/errors/custom_status.dart';
import 'package:periodic_table/core/errors/fetch_data_error.dart';
import 'package:periodic_table/data/datasources/api_service.dart';
import 'package:periodic_table/data/models/periodic_table_model.dart';
import 'package:periodic_table/domain/repositories/periodic_table_repository.dart';

class RemoteDataSourceImplemantation extends PeriodicTableRepository {
  final ApiService apiService;

  RemoteDataSourceImplemantation(this.apiService);

  @override
  Future<Either<AppError, PeriodicTableModel>> getPeriodicTable() async {
    try {
      final response = await apiService.fetchPeriodicTable();
      return Right(response);
    } on CustomException catch (e) {
      throw httpErrorCase(e);
    }
  }

  httpErrorCase(e) {
    switch (e.statusCode) {
      case 400:
        return Left(AppError(e.message.toString()));
      case 401:
        return Left(AppError(e.message.toString()));
      case 404:
        return Left(AppError("The resource you requested could not be found."));
    }
    return Left(AppError("UNKNOWN_ERROR"));
  }
}
