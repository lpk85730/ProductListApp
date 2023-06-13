import 'package:product_list_app/core/error/exceptions.dart';
import 'package:product_list_app/core/services/api_service.dart';
import 'package:product_list_app/feature/cart/data/model/carts_model.dart';
import 'package:product_list_app/feature/cart/domain/usecases/get_carts.dart';
import 'package:product_list_app/injection_container/injection_container.dart';

// ignore: one_member_abstracts
abstract class CartsRemoteDataSource {
  Future<List<CartModel>> getCarts(GetGetCartsParams getGetCartsParams);
}

class CartsRemoteDataSourceImpl implements CartsRemoteDataSource {
  @override
  Future<List<CartModel>> getCarts(
    GetGetCartsParams getGetCartsParams,
  ) async {
    final path = "carts?skip=${getGetCartsParams.offset}&limit=10";
    try {
      final raw = await sl<ApiService>().getRequest(path: path);
      final res = raw.data;
      final List<dynamic> data = res['carts'];
      // ignore:unnecessary_lambdas
      final cartsList = data.map((e) => CartModel.fromJson(e)).toList();
      return cartsList;
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }
}
