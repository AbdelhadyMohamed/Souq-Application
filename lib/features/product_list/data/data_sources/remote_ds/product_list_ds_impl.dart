import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';
import 'package:ecommerce/features/product_list/data/data_sources/remote_ds/product_list_ds.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api/api_manager.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/error/failures.dart';
import '../../models/ProductModel.dart';

@Injectable(as: ProductRemoteDS)
class ProductRemoteDSImpl implements ProductRemoteDS {
  ApiManager apiManager;
  ProductRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      Response response =
          await apiManager.getData(endPoint: EndPoints.productList, data: null);
      ProductModel productModel = ProductModel.fromJson(response.data);
      // print(productModel.results ?? "no results");

      return Right(productModel);
    } catch (e) {
      // print(e.toString());
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartModel>> getCarts(String token) async {
    try {
      Response response = await apiManager.getData(
          endPoint: EndPoints.getCart, data: null, token: token);
      // Map<String, dynamic> result = jsonDecode(response.data.toString());

      CartModel cartModel = CartModel.fromJson(response.data);
      print(cartModel.data ?? "no results");

      return Right(cartModel);
    } catch (e) {
      print(e.toString());

      return Left(RemoteFailures(e.toString()));
    }
  }
}
