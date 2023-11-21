import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/ChangePasswordMessageModel.dart';
import '../repositories/change_password_repo.dart';

@injectable
class ChangePasswordUseCase {
  ChangePasswordRepo repo;
  ChangePasswordUseCase(this.repo);

  Future<Either<Failures, ChangePasswordMessageModel>> call(
          String currentPassword, String password, String rePassword) =>
      repo.changePassword(currentPassword, password, rePassword);
}
