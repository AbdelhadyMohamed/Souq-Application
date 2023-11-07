import 'package:dartz/dartz.dart';

import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/fogot_password/data/data_sources/remote_ds/remote_ds.dart';

import 'package:ecommerce/features/fogot_password/data/models/MessageModel.dart';

import '../../domain/repositories/forgot_repo.dart';

class ResetPasswordRepoImpl implements ResetPasswordRepo {
  ResetPasswordDs resetPasswordDs;

  ResetPasswordRepoImpl(this.resetPasswordDs);

  @override
  Future<Either<Failures, MessageModel>> resetPasswordRepo(
          String? email, String? password) =>
      resetPasswordDs.resetPassword(email, password);
}
