import 'package:ecommerce/features/signup/data/data_sources/remote/remote_ds_impl.dart';
import 'package:ecommerce/features/signup/data/models/request_data.dart';
import 'package:ecommerce/features/signup/data/repositories/sign_up_repo_impl.dart';
import 'package:ecommerce/features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce/features/signup/domain/repositories/sign_up_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/error/failures.dart';
import '../../data/data_sources/remote/remote_ds.dart';
import '../../domain/use_cases/signup_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  ApiManager apiManager;
  static SignUpBloc get(context) => BlocProvider.of(context);
  SignUpBloc(this.apiManager) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        RemoteDataSource remoteDataSource = RemoteDataSourceImpl(apiManager);
        SignUpRepo signUpRepo = SignUpRepoImpl(remoteDataSource);
        SignUpUseCase signUpUseCase = SignUpUseCase(signUpRepo);
        RequestData requestData = RequestData(
            name: "Mohaamed",
            email: "abdalhadymohamed36@gmail.com",
            password: "123@msaA",
            rePassword: "123@msaA",
            phone: "01140233262");
        var result = await signUpUseCase.call(requestData);
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
