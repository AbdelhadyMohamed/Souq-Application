import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/domain/entities/CategoryEntity.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase {
  HomeTabRepo homeTabRepo;

  GetBrandsUseCase(this.homeTabRepo);

  Future<Either<Failures, CategoryEntity>> call() => homeTabRepo.getBrands();
}
