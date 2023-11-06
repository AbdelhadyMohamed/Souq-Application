import 'package:ecommerce/core/api/api_manager.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/login/data/data_source/remote/remote_ds_impl.dart';
import 'package:ecommerce/features/login/data/repo/login_repo_impl.dart';
import 'package:ecommerce/features/login/domain/use_case/login_use_case.dart';
import 'package:ecommerce/features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce/features/signup/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/data_source/remote/remote_ds.dart';
import '../../domain/domain_repo/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginBloc get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LogInButtonEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        LogInRemoteDataSource logInRemoteDataSource =
            LogInRemoteDataSourceImpl(apiManager);
        LogInRepo logInRepo = LogInRepoImpl(logInRemoteDataSource);
        LogInUseCase logInUseCase = LogInUseCase(logInRepo);
        var result = await logInUseCase.call(
            emailController.text, passwordController.text);
        result.fold((l) {
          emit(state.copyWith(screenStatus: ScreenStatus.failure, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenStatus: ScreenStatus.successfully, userEntity: r));
        });
      }
    });
  }
}
