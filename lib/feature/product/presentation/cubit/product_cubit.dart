import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_app/core/error/failure.dart';
import 'package:product_list_app/feature/product/domain/entity/product.dart';
import 'package:product_list_app/feature/product/domain/usecases/get_products.dart';

part 'product_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.getProductsUC}) : super(ProductInitial());

  final GetProductsUC getProductsUC;

  Future<void> getProducts() async {
    emit(ProductDataLoading());
    final getProductsFailedOrSuccess =
        await getProductsUC(const GetProductsParams(offset: 0));
    getProductsFailedOrSuccess.fold(
      (l) {
        final failure = l as GeneralFailure;
        emit(ProductDataFailed(error: failure.error));
        debugPrint("Error: ${failure.error}");
      },
      (r) {
        debugPrint("Data: ${r.length}");
        emit(ProductDataLoaded(productList: r));
      },
    );
  }

  Future<List<Product>> getMoreProducts({required int offset}) async {
    final getProductsFailedOrSuccess =
        await getProductsUC(GetProductsParams(offset: offset));
    if (getProductsFailedOrSuccess.isRight()) {
      try {
        final list = getProductsFailedOrSuccess
            .getOrElse(() => throw Exception("No Value Found"));
        return list;
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  }
}
