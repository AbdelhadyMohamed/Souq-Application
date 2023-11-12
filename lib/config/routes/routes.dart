import 'package:ecommerce/features/fogot_password/presentation/pages/reset_code.dart';
import 'package:ecommerce/features/fogot_password/presentation/pages/reset_password.dart';
import 'package:ecommerce/features/home/presentation/pages/home_screen.dart';
import 'package:ecommerce/features/fogot_password/presentation/pages/forgot_password.dart';
import 'package:ecommerce/features/login/presentation/pages/login.dart';
import 'package:ecommerce/features/product_list/presentation/pages/product_details.dart';
import 'package:ecommerce/features/product_list/presentation/pages/product_list.dart';
import 'package:flutter/material.dart';

import '../../features/signup/presentation/pages/signup.dart';

class AppRoute {
  static const String logIn = "/";
  static const String signUp = "signup";
  static const String homeScreen = "homeScreen";
  static const String productList = "productList";
  static const String productDetails = "productDetails";
  static const String forgotPassword = "forgotPassword";
  static const String resetCode = "resetCode";
  static const String resetPassword = "resetPassword";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case AppRoute.logIn:
        return MaterialPageRoute(builder: (context) => LogInScreen());
      case AppRoute.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case AppRoute.productList:
        return MaterialPageRoute(
            builder: (context) => const ProductListScreen());
      case AppRoute.productDetails:
        return MaterialPageRoute(
            builder: (context) => const ProductDetailsScreen(),
            settings: settings);
      case AppRoute.forgotPassword:
        return MaterialPageRoute(
            builder: (context) => ForgotPasswordScreen(), settings: settings);
      case AppRoute.resetCode:
        return MaterialPageRoute(
            builder: (context) => const ResetCode(), settings: settings);
      case AppRoute.resetPassword:
        return MaterialPageRoute(
            builder: (context) => ResetPasswordScreen(), settings: settings);
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
