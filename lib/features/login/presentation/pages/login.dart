import 'package:ecommerce/config/routes/routes.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/features/signup/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/login_bloc.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.loading) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Center(child: CircularProgressIndicator()),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
          } else if (state.screenStatus == ScreenStatus.successfully) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("success"),
                elevation: 0,
                content: Text(state.userEntity?.user?.name ?? ""),
              ),
            );
            Navigator.pushNamed(context, AppRoute.productList);
          } else if (state.screenStatus == ScreenStatus.failure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                elevation: 0,
                content: Text(state.failures?.message ?? ""),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.blueColor,
            body: Padding(
              padding: EdgeInsets.only(top: 70.h, left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("assets/images/route.png"),
                  const Text("Welcome Back To Route",
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  const Text("Please sign in with your email",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  SizedBox(height: 100.h),
                  const Text("UserName",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  Container(
                      margin: EdgeInsets.only(top: 20.h),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: TextFormField(
                        validator: (value) {
                          return value != null && value.length < 6
                              ? "enter valid input"
                              : null;
                        },
                        controller: LoginBloc.get(context).emailController,
                        keyboardType: TextInputType.emailAddress,
                      )),
                  SizedBox(height: 40.h),
                  const Text("Password",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  Container(
                      margin: EdgeInsets.only(top: 20.h),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: TextFormField(
                        validator: (value) {
                          return value != null && value.length < 6
                              ? "enter valid input"
                              : null;
                        },
                        controller: LoginBloc.get(context).passwordController,
                        obscureText: true,
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 40.h),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          LoginBloc.get(context).add(LogInButtonEvent());
                        },
                        child: Padding(
                          padding: EdgeInsets.all(15.h.w),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20, color: AppColors.blueColor),
                          ),
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // void logInWithEmailAndPassword(BuildContext context) {
  //   // if()
  //   BlocProvider.of<LoginBloc>(context)
  //       .add(LogInButtonEvent(email.text, password.text));
  // }
}
