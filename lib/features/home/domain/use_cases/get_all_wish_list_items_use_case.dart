import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/models/WishListModel.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishListItemsUseCase {
  HomeTabRepo homeTabRepo;
  GetWishListItemsUseCase(this.homeTabRepo);

  Future<Either<Failures, WishListModel>> call() => homeTabRepo.getWishList();
}
