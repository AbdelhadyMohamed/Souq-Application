import 'package:ecommerce/features/product_list/domain/repositories/del_from_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DelFormWishListUseCase {
  DelFromRepo delFromRepo;
  DelFormWishListUseCase(this.delFromRepo);

  Future<void> call(String? productId) async {
    delFromRepo.delFromWishList(productId);
  }
}
