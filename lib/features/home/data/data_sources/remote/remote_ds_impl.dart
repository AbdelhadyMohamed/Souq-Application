import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_manager.dart';
import 'package:ecommerce/core/api/end_points.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/remote_ds.dart';
import 'package:ecommerce/features/home/data/models/CategoryModel.dart';

class HomeTabRemoteDSImpl implements HomeTabRemoteDS {
  ApiManager apiManager;
  HomeTabRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, CategoryModel>> getCategories() async {
    try {
      Response response = await apiManager.getData(
          endPoint: EndPoints.getCategories, data: null);

      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      return Right(categoryModel);
    } on DioException catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
