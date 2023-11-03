import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_manager.dart';
import 'package:ecommerce/core/api/end_points.dart';
import 'package:ecommerce/features/login/data/data_source/remote/remote_ds.dart';
import 'package:ecommerce/features/signup/data/models/UserModel.dart';

import '../../../../../core/error/failures.dart';

class LogInRemoteDataSourceImpl implements LogInRemoteDataSource {
  ApiManager apiManager;

  LogInRemoteDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, UserModel>> login(
      String email, String password) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.signIn,
          body: {"email": email, "password": password});
      UserModel userModel = UserModel.fromJson(response.data);
      return Right(userModel);
    } catch (e) {
      return (Left(RemoteFailures(e.toString())));
    }
  }
}
