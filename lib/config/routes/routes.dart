import 'package:ecommerce/features/home/presentation/pages/home_screen.dart';
import 'package:ecommerce/features/login/presentation/pages/login.dart';
import 'package:ecommerce/features/product_list/presentation/pages/product_details.dart';
import 'package:ecommerce/features/product_list/presentation/pages/product_list.dart';
import 'package:flutter/material.dart';

import '../../features/signup/presentation/pages/signup.dart';

class AppRoute {
  static const String logIn = "login";
  static const String signUp = "/";
  static const String homeScreen = "homeScreen";
  static const String productList = "productList";
  static const String productDetails = "productDetails";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case AppRoute.logIn:
        return MaterialPageRoute(builder: (context) => LogInScreen());
      case AppRoute.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRoute.productList:
        return MaterialPageRoute(
            builder: (context) => const ProductListScreen());
      case AppRoute.productDetails:
        return MaterialPageRoute(
            builder: (context) => const ProductDetailsScreen(),
            settings: settings);
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(title: const Text("error")),
              body: unDefinedRoute(),
            );
          },
        );
    }
  }

  static Widget unDefinedRoute() {
    return const Center(child: Text("Route Not Found"));
  }
}
