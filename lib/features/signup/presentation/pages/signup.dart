import 'package:ecommerce/core/api/api_manager.dart';
import 'package:ecommerce/features/signup/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(ApiManager()),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.loading) {
            showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Center(child: CircularProgressIndicator()));
                });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Sign Up"),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                SignUpBloc.get(context).add(RegisterEvent());
              },
            ),
          );
        },
      ),
    );
  }
}
