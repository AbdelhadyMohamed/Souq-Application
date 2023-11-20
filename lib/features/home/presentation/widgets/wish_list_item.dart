import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/config.dart';
import 'package:ecommerce/features/home/data/models/WishListModel.dart';
import 'package:ecommerce/features/home/presentation/manager/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domain/use_cases/add_to_cart_use_case.dart';
import '../../domain/use_cases/get_all_wish_list_items_use_case.dart';
import '../../domain/use_cases/get_brands_use_case.dart';
import '../../domain/use_cases/get_categories_use_case.dart';

class WishListItem extends StatelessWidget {
  final WishListModel? wishListModel;
  final int index;

  const WishListItem(
      {required this.wishListModel, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w.h),
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.blueColor)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                width: 150.w,
                fit: BoxFit.cover,
                imageUrl: wishListModel?.data?[index].imageCover ?? "",
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              children: [
                SizedBox(height: 15.h),
                SizedBox(
                  width: 200.w,
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          wishListModel?.data?[index].title ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.blueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      // Spacer(),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text("EGP ${wishListModel?.data?[index].price.toString()}",
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: AppColors.blueColor,
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 90.w),
                    Container(
                        padding: EdgeInsets.all(7.w.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white30),
                        child: Icon(Icons.favorite,
                            size: 29, color: AppColors.blueColor)),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueColor,
                  ),
                  child: const Text("Add to cart"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
