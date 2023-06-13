import 'package:dartz/dartz.dart';
import 'package:product_list_app/core/error/failure.dart';
import 'package:product_list_app/feature/product/domain/entity/product.dart';
import 'package:product_list_app/feature/product/domain/usecases/get_products.dart';

// ignore: one_member_abstracts
abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProduct(
      GetProductsParams getProductsParams,
  );
}
