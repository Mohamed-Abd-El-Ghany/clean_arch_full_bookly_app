import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio _dio;

  final baseUrl = "https://www.googleapis.com/books/v1/";

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }

  void post() async {
    Map<String, dynamic> data = {
      "key1": "value1",
    };
    Map<String, dynamic> headers = {
      "key1": "value1",
    };
    Response response =
    await _dio.post('path', data: data, options: Options(headers: headers));

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('POST request successful');
        print(response.data);
      }
    } else {
      if (kDebugMode) {
        print('POST request failed with status code: ${response.statusCode}');
      }
    }
  }
}
