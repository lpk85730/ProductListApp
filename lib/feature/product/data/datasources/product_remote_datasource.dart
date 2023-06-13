import 'package:product_list_app/core/error/exceptions.dart';
import 'package:product_list_app/core/services/api_service.dart';
import 'package:product_list_app/feature/product/data/model/product_model.dart';
import 'package:product_list_app/feature/product/domain/usecases/get_products.dart';
import 'package:product_list_app/injection_container/injection_container.dart';

// ignore: one_member_abstracts
abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProduct(GetProductsParams getProductsParams);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<List<ProductModel>> getProduct(
    GetProductsParams getProductsParams,
  ) async {
    final path = "products?skip=${getProductsParams.offset}&limit=10";
    try {
      final raw = await sl<ApiService>().getRequest(path: path);
      final res = raw.data;
      final List<dynamic> data = res['products'];
      // ignore:unnecessary_lambdas
      final productList = data.map((e) => ProductModel.fromJson(e)).toList();
      return productList;
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }
}
