import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/fogot_password/domain/repositories/forgot_repo.dart';

import '../../data/models/MessageModel.dart';

class ForgotPasswordUseCase {
  ForgotPasswordRepo forgotPasswordRepo;

  ForgotPasswordUseCase(this.forgotPasswordRepo);

  Future<Either<Failures, MessageModel>> call(String? email) =>
      forgotPasswordRepo.forgotPassword(email);
}

class ResetCodeUseCase {
  ResetCodeRepo resetCodeRepo;

  ResetCodeUseCase(this.resetCodeRepo);

  Future<Either<Failures, MessageModel>> call(String? code) =>
      resetCodeRepo.resetCode(code);
}

class ResetPasswordUseCase {
  ResetPasswordRepo resetPasswordRepo;

  ResetPasswordUseCase(this.resetPasswordRepo);

  Future<Either<Failures, MessageModel>> call(
          String? email, String? password) =>
      resetPasswordRepo.resetPasswordRepo(email, password);
}
