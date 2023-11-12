import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';
import 'package:ecommerce/features/home/domain/entities/CategoryEntity.dart';

abstract class HomeTabRepo {
  Future<Either<Failures, CategoryEntity>> getCategories();
  Future<Either<Failures, CategoryEntity>> getBrands();
  Future<Either<Failures, CartModel>> addToCart(String productId);
}
