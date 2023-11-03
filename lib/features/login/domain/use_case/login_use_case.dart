import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/signup/domain/entities/UserEntity.dart';

import '../domain_repo/login_repo.dart';

class LogInUseCase {
  LogInRepo logInRepo;

  LogInUseCase(this.logInRepo);

  Future<Either<Failures, UserEntity>> call(String email, String password) =>
      logInRepo.logIn(email, password);
}
