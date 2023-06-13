import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:product_list_app/core/domain/usecases/usecase.dart';
import 'package:product_list_app/core/error/failure.dart';
import 'package:product_list_app/feature/product/domain/entity/product.dart';
import 'package:product_list_app/feature/product/domain/repositories/product_repository.dart';

class GetProductsUC implements UseCase<List<Product>, GetProductsParams> {
  GetProductsUC({required this.productRepository});

  final ProductRepository productRepository;

  @override
  Future<Either<Failure, List<Product>>> call(
    GetProductsParams getProductsParams,
  ) {
    return productRepository.getProduct(getProductsParams);
  }
}

class GetProductsParams extends Equatable {
  const GetProductsParams({required this.offset});

  final int offset;

  @override
  List<Object?> get props => [offset];
}
