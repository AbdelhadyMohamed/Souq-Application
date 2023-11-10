import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/domain/entities/CategoryEntity.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repositories.dart';

class GetCategoriesUseCase {
  HomeTabRepo homeTabRepo;

  GetCategoriesUseCase(this.homeTabRepo);

  Future<Either<Failures, CategoryEntity>> call() =>
      homeTabRepo.getCategories();
}
