import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService({required Dio dio}) : _dio = dio {
    print('ApiService created');
  }

  Future<Response> fetchData() async {
    final response = await _dio.get('https://dummyjson.com/todos/random');
    return response;
  }
}
