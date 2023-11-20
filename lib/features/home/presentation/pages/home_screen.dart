import 'package:ecommerce/config/routes/routes.dart';
import 'package:ecommerce/features/home/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_all_wish_list_items_use_case.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_brands_use_case.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:ecommerce/features/home/presentation/manager/home_bloc.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/favourite_tab.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/home_tab.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/profile_tab.dart';
import 'package:ecommerce/features/product_list/domain/use_cases/add_to_wish_list_use_case.dart';
import 'package:ecommerce/features/product_list/domain/use_cases/get_carts_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../product_list/domain/use_cases/del_from_use_case.dart';
import '../../../product_list/domain/use_cases/product_list_use_case.dart';
import '../../../product_list/presentation/bloc/product_list_bloc.dart';
import '../../../product_list/presentation/pages/product_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Widget> tabs = [
    const HomeTab(),
    const ProductListScreen(),
    const FavouritesTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomeBloc(
                getIt<GetCategoriesUseCase>(),
                getIt<GetBrandsUseCase>(),
                getIt<AddToCartUseCase>(),
                getIt<GetWishListItemsUseCase>())
              ..add(GetCategoriesEvent())
              ..add(GetBrandsEvent())
              ..add(GetWishList())),
        BlocProvider(
          create: (context) => ProductListBloc(
              getIt<ProductListUseCase>(),
              getIt<GetCartsUseCase>(),
              getIt<AddToWishListUseCase>(),
              getIt<DelFormWishListUseCase>())
            ..add(GetAllProducts()),
        )
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Container(
                padding: EdgeInsets.only(left: 15.w),
                height: 22.h,
                width: 66.w,
                child: Image.asset(
                  "assets/images/route_logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 5.h),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Color(0xFF004182)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Color(0xFF004182)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color(0xFF06004E),
                              ),
                              hintText: 'what do you search for?',
                              hintStyle: TextStyle(
                                color: const Color(0x9906004E),
                                fontSize: 14.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoute.cartScreen);
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          size: 30.0.sp,
                          color: const Color(0xff004182),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Expanded(
                  child: tabs[state.index ?? 0],
                )
              ],
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
              child: BottomNavigationBar(
                onTap: (value) {
                  HomeBloc.get(context).add(TabChange(index: value));
                },
                currentIndex: state.index ?? 0,
                selectedItemColor: AppColors.blueColor,
                type: BottomNavigationBarType.shifting,
                items: [
                  BottomNavigationBarItem(
                      icon: state.index == 0
                          ? Container(
                              padding: EdgeInsets.all(7.w.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white),
                              child: const Icon(Icons.home_outlined))
                          : const Icon(Icons.home_outlined),
                      label: "",
                      backgroundColor: AppColors.blueColor),
                  BottomNavigationBarItem(
                      icon: state.index == 1
                          ? Container(
                              padding: EdgeInsets.all(7.w.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white),
                              child: const Icon(Icons.category_outlined))
                          : const Icon(Icons.category_outlined),
                      label: "",
                      backgroundColor: AppColors.blueColor),
                  BottomNavigationBarItem(
                      icon: state.index == 2
                          ? Container(
                              padding: EdgeInsets.all(7.w.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white),
                              child: const Icon(Icons.favorite_outline_sharp))
                          : const Icon(Icons.favorite_outline_sharp),
                      label: "",
                      backgroundColor: AppColors.blueColor),
                  BottomNavigationBarItem(
                      icon: state.index == 3
                          ? Container(
                              padding: EdgeInsets.all(7.w.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white),
                              child: const Icon(Icons.person_2_outlined))
                          : const Icon(Icons.person_2_outlined),
                      label: "",
                      backgroundColor: AppColors.blueColor),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
