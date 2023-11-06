import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/signup/domain/entities/UserEntity.dart';

import '../../data/models/UserModel.dart';
import '../../data/models/request_data.dart';

abstract class SignUpRepo {
  Future<Either<Failures, UserEntity>> signUp(RequestData requestData);
}
