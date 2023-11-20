part of 'product_list_bloc.dart';

enum ScreenStatus {
  init,
  loading,
  successfully,
  failures,
}

class ProductListState {
  final ScreenStatus? screenStatus;
  final ProductModel? productModel;
  final CartModel? cartModel;
  final Failures? failures;
  bool? isFav;

  ProductListState(
      {this.screenStatus,
      this.productModel,
      this.failures,
      this.cartModel,
      this.isFav});

  ProductListState copyWith({
    ScreenStatus? screenStatus,
    ProductModel? productModel,
    Failures? failures,
    CartModel? cartModel,
    bool? isFav,
  }) {
    return ProductListState(
      screenStatus: screenStatus ?? this.screenStatus,
      productModel: productModel ?? this.productModel,
      failures: failures,
      cartModel: cartModel ?? this.cartModel,
      isFav: isFav,
    );
  }
}

class ProductListInitial extends ProductListState {
  ProductListInitial() : super(screenStatus: ScreenStatus.init);
}
