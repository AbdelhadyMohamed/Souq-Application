import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/models/CategoryBrandsModel.dart';

abstract class HomeTabRemoteDS {
  Future<Either<Failures, CategoryModel>> getCategories();
  Future<Either<Failures, CategoryModel>> getBrands();
}
