import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/signup/data/data_sources/remote/remote_ds.dart';
import 'package:ecommerce/features/signup/domain/repositories/sign_up_repo.dart';
import '../../../../core/error/failures.dart';
import '../models/UserModel.dart';
import '../models/request_data.dart';

class SignUpRepoImpl implements SignUpRepo {
  RemoteDataSource remoteDataSource;

  SignUpRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, UserModel>> signUp(RequestData requestData) =>
      remoteDataSource.signUp(requestData);
}
