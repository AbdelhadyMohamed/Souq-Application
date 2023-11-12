import 'package:dio/dio.dart';
import 'package:ecommerce/core/cache/shared_prefrence.dart';

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
      {required String endPoint,
      required Map<String, dynamic> body,
      String? token}) {
    return dio.post(Constants.baseUrl + endPoint,
        data: body, options: Options(headers: {"token": token}));
  }

  Future<Response> putData({
    required String endPoint,
    required Map<String, dynamic> body,
  }) {
    return dio.put(Constants.baseUrl + endPoint, data: body);
  }
}
