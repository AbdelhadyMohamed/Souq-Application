import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/fogot_password/data/data_sources/remote_ds/remote_ds.dart';
import 'package:ecommerce/features/fogot_password/data/models/MessageModel.dart';
import 'package:ecommerce/features/fogot_password/domain/repositories/forgot_repo.dart';

class ResetCodeRepoImpl implements ResetCodeRepo {
  ResetCodeDS resetCodeDS;
  ResetCodeRepoImpl(this.resetCodeDS);

  @override
  Future<Either<Failures, MessageModel>> resetCode(String? code) =>
      resetCodeDS.resetCode(code);
}
