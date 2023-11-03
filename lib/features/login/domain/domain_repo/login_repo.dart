import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/signup/domain/entities/UserEntity.dart';

import '../../../../core/error/failures.dart';

abstract class LogInRepo {
  Future<Either<Failures, UserEntity>> logIn(String email, String password);
}
