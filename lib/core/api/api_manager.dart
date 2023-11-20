import 'package:dio/dio.dart';
import 'package:ecommerce/core/cache/shared_prefrence.dart';
import 'package:injectable/injectable.dart';

import '../utils/constants.dart';

@singleton
class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
  }
  Future<Response> getData(
      {required String endPoint,
      required Map<String, dynamic>? data,
      String? token}) {
    return dio.get(Constants.baseUrl + endPoint,
        queryParameters: data, options: Options(headers: {"token": token}));
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

  Future<Response> delData(
      {required String endPoint,
      required Map<String, dynamic>? body,
      String? token,
      String? productId}) {
    return dio.delete(Constants.baseUrl + endPoint + productId!,
        options: Options(headers: {"token": token}));
  }
}
