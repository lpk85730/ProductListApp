import 'package:dartz/dartz.dart';
import 'package:product_list_app/core/error/failure.dart';
import 'package:product_list_app/core/presentation/cubits/check_internet_cubit/check_internet_cubit.dart';
import 'package:product_list_app/core/services/short_hand.dart';
import 'package:product_list_app/feature/product/data/datasources/product_remote_datasource.dart';
import 'package:product_list_app/feature/product/domain/entity/product.dart';
import 'package:product_list_app/feature/product/domain/repositories/product_repository.dart';
import 'package:product_list_app/feature/product/domain/usecases/get_products.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.productRemoteDataSource});

  final ProductRemoteDataSource productRemoteDataSource;

  @override
  Future<Either<Failure, List<Product>>> getProduct(
    GetProductsParams getProductsParams,
  ) async {
    if (ShortHand.checkInternetCubit.state is Online) {
      try {
        final List<Product> data =
            await productRemoteDataSource.getProduct(getProductsParams);
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
