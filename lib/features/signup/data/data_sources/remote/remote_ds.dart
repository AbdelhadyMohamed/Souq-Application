import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/signup/data/models/request_data.dart';

import '../../../../../core/error/failures.dart';
import '../../models/UserModel.dart';

abstract class RemoteDataSource {
  Future<Either<Failures, UserModel>> signUp(RequestData requestData);
}
