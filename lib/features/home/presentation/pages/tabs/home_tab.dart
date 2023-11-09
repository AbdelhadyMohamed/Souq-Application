import 'package:ecommerce/features/home/presentation/manager/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../widgets/category_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetCategoriesEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(8.0.w.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.w, left: 16.w),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                              side: BorderSide(
                                  width: 1.w, color: AppColors.blueColor)),
                          elevation: 0,
                          child: SearchBar(
                            hintText: "What do you want to search for?",
                            hintStyle: MaterialStateProperty.resolveWith(
                                (states) =>
                                    const TextStyle(color: Colors.grey)),
                            padding: MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 10.h)),
                            // controller: controller,
                            onTap: () {
                              // controller.openView();
                            },
                            onChanged: (_) {
                              // controller.openView();
                            },
                            leading: Icon(
                              Icons.search,
                              size: 24.sp,
                              color: AppColors.blueColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 13.w),
                      child: Icon(Icons.shopping_cart_outlined,
                          size: 24.sp, color: AppColors.blueColor),
                    )
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
                  child: Row(
                    children: [
                      Text("Categories",
                          style: TextStyle(
                              color: AppColors.darkBlueColor, fontSize: 22.sp)),
                      const Spacer(),
                      Text("view all",
                          style: TextStyle(
                              color: AppColors.darkBlueColor, fontSize: 18.sp)),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: SizedBox(
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 30.w,
                          crossAxisSpacing: 30.w,
                          childAspectRatio: 4 / 3,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) => CategoryItem(
                          index: index, categoryEntity: state.categoryEntity),
                      itemCount: state.categoryEntity?.data?.length ?? 10,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
