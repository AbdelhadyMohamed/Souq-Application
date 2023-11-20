import 'package:ecommerce/features/product_list/domain/repositories/add_to_wish_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/cache/shared_prefrence.dart';
import '../data_sources/remote_ds/product_list_ds.dart';

@Injectable(as: AddToWishListRepo)
class AddToWishListRepoImpl implements AddToWishListRepo {
  ProductRemoteDS remoteDS;

  AddToWishListRepoImpl(this.remoteDS);

  @override
  Future<void> addToWishList(String productId) async {
    String? token = await getToken();
    remoteDS.addToWishList(token ?? "", productId);
  }

  Future<String?> getToken() async {
    return CacheData.getData("token");
  }
}
