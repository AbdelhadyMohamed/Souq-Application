import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_manager.dart';
import 'package:ecommerce/core/api/end_points.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/remote_ds.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';
import 'package:ecommerce/features/home/data/models/CategoryBrandsModel.dart';

import '../../../../signup/data/models/ErrorModel.dart';

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

  @override
  Future<Either<Failures, CategoryModel>> getBrands() async {
    try {
      Response response =
          await apiManager.getData(endPoint: EndPoints.getBrands, data: null);

      CategoryModel brandsModel = CategoryModel.fromJson(response.data);
      return Right(brandsModel);
    } on DioException catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartModel>> addToCart(
      String productId, String token) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.addToCart,
          body: {"productId": productId},
          token: token);

      CartModel cartModel = CartModel.fromJson(response.data);
      return Right(cartModel);
    } on DioException catch (e) {
      Map<String, dynamic> response = jsonDecode(e.response.toString());
      ErrorModel errorModel = ErrorModel.fromJson(response);
      print(errorModel.message ?? "");
      return Left(RemoteFailures(errorModel.message.toString()));
    }
  }
}
