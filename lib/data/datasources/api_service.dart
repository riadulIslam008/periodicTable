import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:periodic_table/core/errors/custom_status.dart';
import 'package:periodic_table/data/datasources/api.dart';
import 'package:periodic_table/data/models/periodic_table_model.dart';

class ApiService {
  dynamic fetchPeriodicTable() async {
    final response = await http.get(Uri.parse(ApiConstants.apiUrl));

    if (response.statusCode == 200) {
    //  print(response);
      final decodedJson = json.decode(response.body);
      return PeriodicTableModel.fromJson(decodedJson);
    //  final result = PeriodicTableModel.fromJson(decodedJson);
    //   print("$result");
    } else {
      throw CustomException(
        message: response.reasonPhrase!,
        statusCode: response.statusCode,
      );
    }
  }
}
