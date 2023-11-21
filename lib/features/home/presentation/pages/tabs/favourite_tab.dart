import 'package:ecommerce/features/home/domain/use_cases/change_password_use_case.dart';
import 'package:ecommerce/features/home/presentation/manager/home_bloc.dart';
import 'package:ecommerce/features/home/presentation/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config.dart';
import '../../../domain/use_cases/add_to_cart_use_case.dart';
import '../../../domain/use_cases/get_all_wish_list_items_use_case.dart';
import '../../../domain/use_cases/get_brands_use_case.dart';
import '../../../domain/use_cases/get_categories_use_case.dart';

class FavouritesTab extends StatelessWidget {
  const FavouritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        getIt<GetCategoriesUseCase>(),
        getIt<GetBrandsUseCase>(),
        getIt<AddToCartUseCase>(),
        getIt<GetWishListItemsUseCase>(),
        getIt<ChangePasswordUseCase>(),
      )..add(GetWishList()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.screenStatus == HomeScreenStatus.loading
              ? const Center(child: CircularProgressIndicator())
              : state.screenStatus == HomeScreenStatus.wishListSuccess
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return WishListItem(
                            wishListModel: state.wishListModel, index: index);
                      },
                      itemCount: state.wishListModel?.data?.length,
                    )
                  : const SizedBox();
        },
      ),
    );
  }
}
