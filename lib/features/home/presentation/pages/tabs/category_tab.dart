// import 'package:ecommerce/core/utils/app_colors.dart';
// import 'package:ecommerce/features/home/presentation/manager/home_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CategoryTab extends StatelessWidget {
//   const CategoryTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeBloc, HomeState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Padding(
//           padding: EdgeInsets.all(16.w.h),
//           child: Row(
//             children: [
//               Expanded(
//                 child: NavigationRail(
//                   destinations: [
//                     NavigationRailDestination(
//                       icon: Container(
//                           height: 100.h,
//                           child: IntrinsicHeight(
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 VerticalDivider(
//                                   thickness: 7,
//                                   indent: 20,
//                                   endIndent: 0,
//                                   color: AppColors.darkBlueColor,
//                                 ),
//                                 const Padding(
//                                   padding: EdgeInsets.only(top: 10),
//                                   child: Text("Fashion"),
//                                 ),
//                               ],
//                             ),
//                           )),
//                       label: Text('First'),
//                     ),
//                     NavigationRailDestination(
//                       icon: Container(
//                           height: 100.h,
//                           child: IntrinsicHeight(
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 VerticalDivider(
//                                   thickness: 7,
//                                   indent: 20,
//                                   endIndent: 0,
//                                   color: AppColors.darkBlueColor,
//                                 ),
//                                 const Padding(
//                                   padding: EdgeInsets.only(top: 10),
//                                   child: Text("Fashion"),
//                                 ),
//                               ],
//                             ),
//                           )),
//                       label: Text('First'),
//                     ),
//                   ],
//                   selectedIndex: 1,
//                 ),
//               ),
//               Expanded(
//                 flex: 4,
//                 child: Column(
//                   children: [Container(color: Colors.green)],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
