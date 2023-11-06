import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_manager.dart';
import 'package:ecommerce/core/api/end_points.dart';
import 'package:ecommerce/features/signup/data/data_sources/remote/remote_ds.dart';
import 'package:ecommerce/features/signup/data/models/ErrorModel.dart';
import 'package:ecommerce/features/signup/data/models/UserModel.dart';

import '../../../../../core/error/failures.dart';
import '../../models/request_data.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  ApiManager apiManager;
  RemoteDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, UserModel>> signUp(RequestData requestData) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.signUp, body: requestData.toJson());
      UserModel userModel = UserModel.fromJson(response.data);
      // print(userModel.token ?? "token not found");
      return Right(userModel);
    } on DioException catch (e) {
      Map<String, dynamic> response = jsonDecode(e.response.toString());
      ErrorModel errorModel = ErrorModel.fromJson(response);
      if (errorModel.message == "fail") {
        return Left(RemoteFailures(errorModel.errors?.msg ?? "Error"));
      } else {
        return Left(RemoteFailures(errorModel.message ?? "Error"));
      }
    }
  }
}
