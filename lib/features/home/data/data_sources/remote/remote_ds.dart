import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/models/CategoryModel.dart';

abstract class HomeTabRemoteDS {
  Future<Either<Failures, CategoryModel>> getCategories();
}
