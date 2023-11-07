import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/fogot_password/data/data_sources/remote_ds/remote_ds.dart';
import 'package:ecommerce/features/fogot_password/data/models/MessageModel.dart';
import 'package:ecommerce/features/fogot_password/domain/repositories/forgot_repo.dart';

import '../../../../core/error/failures.dart';

class ForgotRepoImpl implements ForgotPasswordRepo {
  PasswordRemoteDS passwordRemoteDS;
  ForgotRepoImpl(this.passwordRemoteDS);

  @override
  Future<Either<Failures, MessageModel>> forgotPassword(String? email) =>
      passwordRemoteDS.forgotPassword(email);
}
