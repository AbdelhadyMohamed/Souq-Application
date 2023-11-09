import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/home/domain/entities/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity? categoryEntity;
  final int index;
  const CategoryItem(
      {required this.index, required this.categoryEntity, super.key});
  @override
  Widget build(BuildContext context) {
    var category = categoryEntity?.data?[index];

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(250.r),
          child: SizedBox(
            child: CachedNetworkImage(
              width: 200.w,
              height: 200.h,
              fit: BoxFit.cover,
              imageUrl: category?.image ?? "",
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outline),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(category?.name ?? "",
            style: TextStyle(fontSize: 22.sp, color: AppColors.darkBlueColor))
      ],
    );
  }
}
