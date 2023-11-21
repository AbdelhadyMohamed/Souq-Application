import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';
import 'package:ecommerce/features/home/data/models/CategoryBrandsModel.dart';
import 'package:ecommerce/features/home/data/models/WishListModel.dart';

import '../../models/ChangePasswordMessageModel.dart';

abstract class HomeTabRemoteDS {
  Future<Either<Failures, CategoryModel>> getCategories();
  Future<Either<Failures, CategoryModel>> getBrands();
  Future<Either<Failures, CartModel>> addToCart(String productId, String token);
  Future<Either<Failures, WishListModel>> getWishList(String token);
  Future<Either<Failures, ChangePasswordMessageModel>> changePassword(
      String currentPassword,
      String password,
      String rePassword,
      String? token);
}
