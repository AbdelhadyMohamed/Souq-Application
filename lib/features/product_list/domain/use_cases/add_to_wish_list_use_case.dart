import 'package:ecommerce/features/product_list/domain/repositories/add_to_wish_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToWishListUseCase {
  AddToWishListRepo addToWishListRepo;
  AddToWishListUseCase(this.addToWishListRepo);

  Future<void> call(String productId) async {
    addToWishListRepo.addToWishList(productId);
  }
}
