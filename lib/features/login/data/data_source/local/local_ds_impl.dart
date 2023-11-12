import 'package:ecommerce/core/cache/shared_prefrence.dart';
import 'package:ecommerce/features/login/data/data_source/local/local_ds.dart';

class LogInLocalDSImpl implements LogInLocalDS {
  @override
  Future<bool> cacheToken(String token) {
    try {
      return CacheData.saveData("token", token);
    } catch (e) {
      throw Exception();
    }
  }
}
