import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';
import 'package:ecommerce/features/product_list/domain/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartsUseCase {
  CartRepo cartRepo;

  GetCartsUseCase(this.cartRepo);

  Future<Either<Failures, CartModel>> call() => cartRepo.getCarts();
}
