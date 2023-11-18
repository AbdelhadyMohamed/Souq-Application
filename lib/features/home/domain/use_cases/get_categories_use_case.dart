import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/domain/entities/CategoryEntity.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  HomeTabRepo homeTabRepo;

  GetCategoriesUseCase(this.homeTabRepo);

  Future<Either<Failures, CategoryEntity>> call() =>
      homeTabRepo.getCategories();
}
