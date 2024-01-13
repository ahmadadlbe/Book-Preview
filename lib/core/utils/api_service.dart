import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(String endpoint) async {
    var respon = await _dio.get("$_baseUrl$endpoint");
    return respon.data;
  }
}
