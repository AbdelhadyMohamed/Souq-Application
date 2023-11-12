import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repositories.dart';

class AddToCartUseCase {
  HomeTabRepo homeTabRepo;

  AddToCartUseCase(this.homeTabRepo);
  Future<Either<Failures, CartModel>> call(String productId) =>
      homeTabRepo.addToCart(productId);
}
