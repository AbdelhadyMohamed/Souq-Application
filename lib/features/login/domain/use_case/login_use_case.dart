import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';

import '../../../signup/data/models/UserModel.dart';
import '../domain_repo/login_repo.dart';

class LogInUseCase {
  LogInRepo logInRepo;

  LogInUseCase(this.logInRepo);

  Future<Either<Failures, UserModel>> call(String email, String password) =>
      logInRepo.logIn(email, password);
}
