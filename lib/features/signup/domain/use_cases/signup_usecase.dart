import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/signup/data/models/request_data.dart';
import 'package:ecommerce/features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce/features/signup/domain/repositories/sign_up_repo.dart';

class SignUpUseCase {
  SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  Future<Either<Failures, UserEntity>> call(RequestData requestData) =>
      signUpRepo.signUp(requestData);
}
