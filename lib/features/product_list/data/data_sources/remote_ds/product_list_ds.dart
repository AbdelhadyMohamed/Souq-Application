import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';

import '../../../../../core/error/failures.dart';
import '../../models/ProductModel.dart';

abstract class ProductRemoteDS {
  Future<Either<Failures, ProductModel>> getProducts();
  Future<Either<Failures, CartModel>> getCarts(String token);
  void addToWishList(String token, String productId);
  void delFromWishList(String productId, String token);
}
