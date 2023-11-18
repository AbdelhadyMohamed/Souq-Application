import 'package:ecommerce/config.dart';
import 'package:ecommerce/config/routes/routes.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/features/login/domain/use_case/login_use_case.dart';
import 'package:ecommerce/features/signup/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/login_bloc.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(getIt<LogInUseCase>()),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.loading) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.blueGrey)),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
          } else if (state.screenStatus == ScreenStatus.successfully) {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("success",
                        style: TextStyle(color: Colors.green, fontSize: 18)),
                    elevation: 0,
                    content: Text("welcome ${state.userEntity?.user?.name}"),
                  );
                });

            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.homeScreen, (route) => false);
          } else if (state.screenStatus == ScreenStatus.failure) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error", style: TextStyle(fontSize: 18)),
                elevation: 0,
                content: Text(state.failures?.message ?? "error",
                    style: const TextStyle(color: Colors.red)),
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
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset("assets/images/route.png"),
                    const Text("Welcome Back To Route",
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                    const Text("Please sign in with your email",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    SizedBox(height: 70.h),
                    const Text("UserName",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Container(
                        margin: EdgeInsets.only(top: 20.h),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: TextFormField(
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter your email';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter your email'),
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
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter a password';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter your password'),
                          controller: LoginBloc.get(context).passwordController,
                          obscureText: true,
                        )),
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.forgotPassword);
                      },
                      child: const Text("Forgot Password",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40.h),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              LoginBloc.get(context).add(LogInButtonEvent());
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(15.h.w),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.blueColor),
                            ),
                          )),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                            style: TextStyle(
                                color: Colors.white, fontSize: 18.sp)),
                        SizedBox(width: 10.w),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, AppRoute.signUp, (route) => false);
                              LoginBloc.get(context).emailController.text = "";
                              LoginBloc.get(context).passwordController.text =
                                  "";
                            },
                            child: Text("Create Account",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.sp))),
                      ],
                    )
                  ],
                ),
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
