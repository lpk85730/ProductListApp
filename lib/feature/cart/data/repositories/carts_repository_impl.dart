import 'package:dartz/dartz.dart';
import 'package:product_list_app/core/error/failure.dart';
import 'package:product_list_app/core/presentation/cubits/check_internet_cubit/check_internet_cubit.dart';
import 'package:product_list_app/core/services/short_hand.dart';
import 'package:product_list_app/feature/cart/data/datasources/carts_remote_datasource.dart';
import 'package:product_list_app/feature/cart/data/model/carts_model.dart';
import 'package:product_list_app/feature/cart/domain/repositories/carts_repository.dart';
import 'package:product_list_app/feature/cart/domain/usecases/get_carts.dart';

class CartsRepositoryImpl implements CartsRepository {
  CartsRepositoryImpl({required this.cartsRemoteDataSource});

  final CartsRemoteDataSource cartsRemoteDataSource;

  @override
  Future<Either<Failure, List<CartModel>>> getCarts(
    GetGetCartsParams getGetCartsParams,
  ) async {
    if (ShortHand.checkInternetCubit.state is Online) {
      try {
        final data = await cartsRemoteDataSource.getCarts(getGetCartsParams);
        return Right(data);
      } catch (e) {
        return Left(GeneralFailure(error: e.toString()));
      }
    } else {
      return Left(
        GeneralFailure(
          error: "Something went wrong. Please try again sometimes!",
        ),
      );
    }
  }
}
