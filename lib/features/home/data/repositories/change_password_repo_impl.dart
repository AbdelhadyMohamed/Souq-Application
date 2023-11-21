import 'package:dartz/dartz.dart';

import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/remote_ds.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/cache/shared_prefrence.dart';
import '../../domain/repositories/change_password_repo.dart';
import '../models/ChangePasswordMessageModel.dart';

@Injectable(as: ChangePasswordRepo)
class ChangePasswordRepoImpl implements ChangePasswordRepo {
  HomeTabRemoteDS remoteDS;
  ChangePasswordRepoImpl(this.remoteDS);

  @override
  Future<Either<Failures, ChangePasswordMessageModel>> changePassword(
      String currentPassword, String password, String rePassword) async {
    String? token = await getToken();
    return remoteDS.changePassword(
        currentPassword, password, rePassword, token);
  }

  Future<String?> getToken() async {
    return CacheData.getData("token");
  }
}
