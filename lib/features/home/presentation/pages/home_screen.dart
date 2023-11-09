import 'package:ecommerce/features/home/presentation/manager/home_bloc.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/category_tab.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/favourite_tab.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/home_tab.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/profile_tab.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final int index = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeBloc())],
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final List tabs = [
            const HomeTab(),
            const CategoryTab(),
            const FavouritesTab(),
            const ProfileTab(),
          ];
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
            body: tabs[state.index ?? 0],
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r)),
              child: BottomNavigationBar(
                onTap: (value) {
                  HomeBloc.get(context).add(TabChange(tabIndex: value));
                },
                currentIndex: state.index ?? 0,
                selectedItemColor: AppColors.darkBlueColor,
                items: [
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.home),
                      label: "",
                      backgroundColor: AppColors.blueColor),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.category_outlined),
                      label: "",
                      backgroundColor: AppColors.blueColor),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.favorite_border),
                      label: "",
                      backgroundColor: AppColors.blueColor),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.person_4_outlined),
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
