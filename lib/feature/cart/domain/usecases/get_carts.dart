import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:product_list_app/core/domain/usecases/usecase.dart';
import 'package:product_list_app/core/error/failure.dart';
import 'package:product_list_app/feature/cart/data/model/carts_model.dart';
import 'package:product_list_app/feature/cart/domain/repositories/carts_repository.dart';

class GetCartsUC implements UseCase<List<CartModel>, GetGetCartsParams> {
  GetCartsUC({required this.cartsRepository});

  final CartsRepository cartsRepository;

  @override
  Future<Either<Failure, List<CartModel>>> call(
    GetGetCartsParams getGetCartsParams,
  ) {
    return cartsRepository.getCarts(getGetCartsParams);
  }
}

class GetGetCartsParams extends Equatable {
  const GetGetCartsParams({required this.offset});

  final int offset;

  @override
  List<Object?> get props => [offset];
}
