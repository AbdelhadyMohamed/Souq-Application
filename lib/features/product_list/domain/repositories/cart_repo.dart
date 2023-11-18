import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';

import '../../../../core/error/failures.dart';

abstract class CartRepo {
  Future<Either<Failures, CartModel>> getCarts();
}
