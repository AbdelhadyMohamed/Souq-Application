import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/signup/data/models/UserModel.dart';

import '../../../../../core/error/failures.dart';

abstract class LogInRemoteDataSource {
  Future<Either<Failures, UserModel>> login(String email, String password);
}
