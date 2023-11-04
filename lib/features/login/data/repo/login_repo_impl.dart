import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/login/data/data_source/remote/remote_ds.dart';
import 'package:ecommerce/features/login/domain/domain_repo/login_repo.dart';
import 'package:ecommerce/features/signup/data/models/UserModel.dart';
import '../../../../core/error/failures.dart';

class LogInRepoImpl implements LogInRepo {
  LogInRemoteDataSource logInRemoteDataSource;

  LogInRepoImpl(this.logInRemoteDataSource);

  @override
  Future<Either<Failures, UserModel>> logIn(String email, String password) {
    try {
      return logInRemoteDataSource.login(email, password);
    } catch (e) {
      throw (RemoteFailures("something went wrong"));
    }
  }
}
