import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';
import 'package:ecommerce/features/product_list/data/data_sources/remote_ds/product_list_ds.dart';
import 'package:ecommerce/features/product_list/domain/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/cache/shared_prefrence.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  ProductRemoteDS remoteDS;

  CartRepoImpl(this.remoteDS);

  @override
  Future<Either<Failures, CartModel>> getCarts() async {
    String? token = await getToken();
    return remoteDS.getCarts(token ?? "");
  }

  Future<String?> getToken() async {
    return CacheData.getData("token");
  }
}
