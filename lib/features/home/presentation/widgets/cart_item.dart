import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';
import 'package:ecommerce/features/product_list/data/models/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final int index;
  final CartModel? cartModel;
  const CartItem({this.cartModel, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 150.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.blueColor)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                width: 120.w,
                fit: BoxFit.cover,
                imageUrl:
                    cartModel?.data?.products![index].product?.imageCover ?? "",
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Text(
                      cartModel?.data!.products?[index].product?.title ?? "",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Spacer(),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                        "EGP ${cartModel?.data!.products?[index].price.toString()}",
                        style: TextStyle(fontSize: 20)),
                    SizedBox(width: 130.w),
                    Icon(Icons.delete, size: 29, color: AppColors.blueColor),
                  ],
                ),
                const Spacer(),
                Text(
                    "count: ${cartModel?.data!.products?[index].count.toString()}",
                    style: const TextStyle(fontSize: 20)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
