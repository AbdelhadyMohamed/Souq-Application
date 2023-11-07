import 'package:dio/dio.dart';

import '../utils/constants.dart';

class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
  }
  Future<Response> getData(
      {required String endPoint, required Map<String, dynamic>? data}) {
    return dio.get(Constants.baseUrl + endPoint, queryParameters: data);
  }

  Future<Response> postData(
      {required String endPoint, required Map<String, dynamic> body}) {
    return dio.post(Constants.baseUrl + endPoint, data: body);
  }

  Future<Response> putData(
      {required String endPoint, required Map<String, dynamic> body}) {
    return dio.put(Constants.baseUrl + endPoint, data: body);
  }
}
