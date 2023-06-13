import 'package:dartz/dartz.dart';
import 'package:product_list_app/core/error/failure.dart';
import 'package:product_list_app/feature/cart/data/model/carts_model.dart';
import 'package:product_list_app/feature/cart/domain/usecases/get_carts.dart';

// ignore: one_member_abstracts
abstract class CartsRepository {
  Future<Either<Failure, List<CartModel>>> getCarts(
    GetGetCartsParams getGetCartsParams,
  );
}
