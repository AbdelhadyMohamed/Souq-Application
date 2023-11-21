import 'package:ecommerce/features/product_list/domain/use_cases/add_to_wish_list_use_case.dart';
import 'package:ecommerce/features/product_list/domain/use_cases/del_from_use_case.dart';
import 'package:ecommerce/features/product_list/domain/use_cases/get_carts_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../product_list/domain/use_cases/product_list_use_case.dart';
import '../../../product_list/presentation/bloc/product_list_bloc.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductListBloc(
          getIt<ProductListUseCase>(),
          getIt<GetCartsUseCase>(),
          getIt<AddToWishListUseCase>(),
          getIt<DelFormWishListUseCase>())
        ..add(GetCart()),
      child: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: const BackButton(color: Colors.black),
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  SizedBox(width: 28.w),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Cart",
                        style: TextStyle(
                            fontSize: 20.sp, color: AppColors.blueColor),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.search, color: AppColors.blueColor, size: 20.sp),
                  SizedBox(width: 28.w),
                  Icon(Icons.shopping_cart_outlined,
                      color: AppColors.blueColor, size: 20.sp)
                ],
              ),
              elevation: 0,
            ),
            body: state.screenStatus == ScreenStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return CartItem(
                                cartModel: state.cartModel, index: index);
                          },
                          itemCount: state.cartModel?.data?.products?.length,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20.w),
                          Row(
                            children: [
                              const Text(
                                "total price: ",
                                style: TextStyle(fontSize: 17),
                              ),
                              Text(
                                "${state.cartModel?.data?.totalCartPrice} Egp",
                                style: const TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.blueColor,
                            ),
                            height: 70.h,
                            width: 200.w,
                            child: const Center(
                              child: Text(
                                "Check out",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
