import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/error/failures.dart';

import 'package:ecommerce/features/home/domain/entities/CategoryEntity.dart';
import 'package:ecommerce/features/home/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/get_brands_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;
  AddToCartUseCase addToCartUseCase;
  static HomeBloc get(context) => BlocProvider.of(context);
  HomeBloc(
      this.getCategoriesUseCase, this.getBrandsUseCase, this.addToCartUseCase)
      : super(HomeInitial(index: 0)) {
    on<HomeEvent>((event, emit) async {
      state.copyWith(screenStatus: ScreenStatus.loading);
      if (event is GetCategoriesEvent) {
        var result = await getCategoriesUseCase.call();
        result.fold((l) {
          emit(state.copyWith(
              screenStatus: ScreenStatus.categoryFailure, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenStatus: ScreenStatus.categorySuccess, categoryEntity: r));
        });
      } else if (event is GetBrandsEvent) {
        var result = await getBrandsUseCase.call();
        result.fold((l) {
          emit(state.copyWith(
              screenStatus: ScreenStatus.brandsFailure, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenStatus: ScreenStatus.brandsSuccess, brandsEntity: r));
        });
      } else if (event is TabChange) {
        emit(state.copyWith(
            screenStatus: ScreenStatus.changeNavBar, index: event.index));
      } else if (event is AddToCartEvent) {
        var result = await addToCartUseCase.call(event.id);
        result.fold((l) {}, (r) {
          print("Success");
        });
      }
    });
  }
}
