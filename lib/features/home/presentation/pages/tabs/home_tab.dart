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
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
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
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16.w,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 4 / 5,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => CategoryItem(
                    index: index, categoryEntity: state.categoryEntity),
                itemCount: state.categoryEntity?.data?.length ?? 10,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
              child: Row(
                children: [
                  Text("Brands",
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
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16.w,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 2 / 3,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => CategoryItem(
                    index: index, categoryEntity: state.brandsEntity),
                itemCount: state.brandsEntity?.data?.length ?? 10,
              ),
            ),
          ],
        );
      },
    );
  }
}
