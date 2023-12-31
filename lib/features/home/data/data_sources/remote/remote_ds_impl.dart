import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_manager.dart';
import 'package:ecommerce/core/api/end_points.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/remote_ds.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';
import 'package:ecommerce/features/home/data/models/CategoryBrandsModel.dart';
import 'package:ecommerce/features/home/data/models/ChangePasswordMessageModel.dart';
import 'package:ecommerce/features/home/data/models/WishListModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../signup/data/models/ErrorModel.dart';

@Injectable(as: HomeTabRemoteDS)
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

  @override
  Future<Either<Failures, WishListModel>> getWishList(String token) async {
    try {
      Response response = await apiManager.getData(
          endPoint: EndPoints.getWishList, data: null, token: token);

      WishListModel wishListModel = WishListModel.fromJson(response.data);
      return Right(wishListModel);
    } on DioException catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ChangePasswordMessageModel>> changePassword(
      String currentPassword,
      String password,
      String rePassword,
      String? token) async {
    try {
      Response response = await apiManager
          .putData(endPoint: EndPoints.changePassword, token: token, body: {
        "currentPassword": currentPassword,
        "password": password,
        "rePassword": rePassword
      });
      ChangePasswordMessageModel messageModel =
          ChangePasswordMessageModel.fromJson(response.data);
      return Right(messageModel);
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
