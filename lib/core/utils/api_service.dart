import 'package:dio/dio.dart';

class ApiServices {
  final _baseurl = "https://www.googleapis.com/books/v1/";
  final Dio _dio;

  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseurl$endPoint');
    return response.data;
  }
}
