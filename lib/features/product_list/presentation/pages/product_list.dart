import 'package:ecommerce/features/product_list/presentation/bloc/product_list_bloc.dart';
import 'package:ecommerce/features/product_list/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: state.productModel?.data?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (192 / 237),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w),
                itemBuilder: (context, index) {
                  return ProductItem(
                      productModel: state.productModel, index: index);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
