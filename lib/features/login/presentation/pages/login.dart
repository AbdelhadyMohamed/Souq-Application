import 'package:ecommerce/features/signup/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          }
          if (state.screenStatus == ScreenStatus.successfully) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("success"),
                elevation: 0,
                content: Text(state.userEntity?.user?.name ?? ""),
              ),
            );
          }
          if (state.screenStatus == ScreenStatus.failure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("failed"),
                elevation: 0,
                content: Text(state.failures?.message ?? ""),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("log in")),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                LoginBloc.get(context).add(LogInButtonEvent());
              },
            ),
          );
        },
      ),
    );
  }
}
