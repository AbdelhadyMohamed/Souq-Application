import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/remote_ds.dart';
import 'package:ecommerce/features/home/data/models/CategoryModel.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repositories.dart';

class HomeTabRepoImpl implements HomeTabRepo {
  HomeTabRemoteDS homeTabRemoteDS;
  HomeTabRepoImpl(this.homeTabRemoteDS);

  @override
  Future<Either<Failures, CategoryModel>> getCategories() =>
      homeTabRemoteDS.getCategories();
}
