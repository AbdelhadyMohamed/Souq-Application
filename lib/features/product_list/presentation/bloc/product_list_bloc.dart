import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';
import 'package:ecommerce/features/product_list/domain/use_cases/get_carts_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/ProductModel.dart';
import '../../domain/use_cases/product_list_use_case.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

@injectable
class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  static ProductListBloc get(context) => BlocProvider.of(context);
  ProductListUseCase productListUseCase;
  GetCartsUseCase getCartsUseCase;
  ProductListBloc(this.productListUseCase, this.getCartsUseCase)
      : super(ProductListInitial()) {
    on<ProductListEvent>((event, emit) async {
      if (event is GetAllProducts) {
        var result = await productListUseCase.call();
        result.fold((l) {
          emit(
              state.copyWith(screenStatus: ScreenStatus.failures, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenStatus: ScreenStatus.successfully, productModel: r));
        });
      } else if (event is GetCart) {
        var result = await getCartsUseCase.call();
        result.fold((l) {
          emit(
              state.copyWith(screenStatus: ScreenStatus.failures, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenStatus: ScreenStatus.successfully, cartModel: r));
        });
      }
    });
  }
}
