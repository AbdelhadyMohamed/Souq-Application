import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/cache/shared_prefrence.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/remote_ds.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';
import 'package:ecommerce/features/home/data/models/CategoryBrandsModel.dart';
import 'package:ecommerce/features/home/domain/entities/CategoryEntity.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repositories.dart';

class HomeTabRepoImpl implements HomeTabRepo {
  HomeTabRemoteDS homeTabRemoteDS;
  HomeTabRepoImpl(this.homeTabRemoteDS);

  @override
  Future<Either<Failures, CategoryModel>> getCategories() =>
      homeTabRemoteDS.getCategories();

  @override
  Future<Either<Failures, CategoryModel>> getBrands() =>
      homeTabRemoteDS.getBrands();

  @override
  Future<Either<Failures, CartModel>> addToCart(String productId) async {
    String? token = await getToken();
    return homeTabRemoteDS.addToCart(productId, token ?? "");
  }

  Future<String?> getToken() async {
    return CacheData.getData("token");
  }
}
