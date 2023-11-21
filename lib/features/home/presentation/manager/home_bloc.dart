import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/models/ChangePasswordMessageModel.dart';
import 'package:ecommerce/features/home/data/models/WishListModel.dart';

import 'package:ecommerce/features/home/domain/entities/CategoryEntity.dart';
import 'package:ecommerce/features/home/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce/features/home/domain/use_cases/change_password_use_case.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_all_wish_list_items_use_case.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:ecommerce/features/product_list/presentation/bloc/product_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/cache/shared_prefrence.dart';
import '../../domain/use_cases/get_brands_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;
  AddToCartUseCase addToCartUseCase;
  ChangePasswordUseCase changePasswordUseCase;
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  GetWishListItemsUseCase getWishListItemsUseCase;
  static HomeBloc get(context) => BlocProvider.of(context);
  static List<String>? getIds = [];
  HomeBloc(
      this.getCategoriesUseCase,
      this.getBrandsUseCase,
      this.addToCartUseCase,
      this.getWishListItemsUseCase,
      this.changePasswordUseCase)
      : super(HomeInitial(index: 0)) {
    on<HomeEvent>((event, emit) async {
      emit(state.copyWith(screenStatus: HomeScreenStatus.loading));
      if (event is GetCategoriesEvent) {
        var result = await getCategoriesUseCase.call();
        result.fold((l) {
          emit(state.copyWith(
              screenStatus: HomeScreenStatus.categoryFailure, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenStatus: HomeScreenStatus.categorySuccess,
              categoryEntity: r));
        });
      } else if (event is GetBrandsEvent) {
        var result = await getBrandsUseCase.call();
        result.fold((l) {
          emit(state.copyWith(
              screenStatus: HomeScreenStatus.brandsFailure, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenStatus: HomeScreenStatus.brandsSuccess, brandsEntity: r));
        });
      } else if (event is TabChange) {
        emit(state.copyWith(
            screenStatus: HomeScreenStatus.changeNavBar, index: event.index));
      } else if (event is AddToCartEvent) {
        var result = await addToCartUseCase.call(event.id);
        result.fold((l) {}, (r) {
          print("Success");
        });
      } else if (event is GetWishList) {
        var result = await getWishListItemsUseCase.call();
        result.fold((l) {
          emit(state.copyWith(
              screenStatus: HomeScreenStatus.wishListFailure, failures: l));
        }, (r) {
          for (int i = 0; i < r.data!.length; i++) {
            getIds?.add(r.data![i].id!);
            print(getIds?[i]);
          }
          emit(state.copyWith(
              screenStatus: HomeScreenStatus.wishListSuccess,
              wishListModel: r));
        });
      } else if (event is GetUserData) {
        String? userName = await CacheData.getData("userName");
        String? userEmail = await CacheData.getData("userEmail");
        emit(state.copyWith(
            screenStatus: HomeScreenStatus.saveUserDataSuccess,
            email: userEmail,
            name: userName));
      } else if (event is ChangePassword) {
        var result = await changePasswordUseCase.call(
            currentPassword.text, newPassword.text, rePassword.text);
        result.fold((l) {
          emit(state.copyWith(
              screenStatus: HomeScreenStatus.passwordChangFailure,
              failures: l));
        }, (r) {
          emit(state.copyWith(
            screenStatus: HomeScreenStatus.passwordChangSuccess,
          ));
        });
      }
    });
  }
}
