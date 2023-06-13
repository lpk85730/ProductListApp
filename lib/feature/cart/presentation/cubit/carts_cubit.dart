import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_app/core/error/failure.dart';
import 'package:product_list_app/feature/cart/data/model/carts_model.dart';
import 'package:product_list_app/feature/cart/domain/usecases/get_carts.dart';

part 'carts_state.dart';

class CartsCubit extends Cubit<CartsState> {
  CartsCubit({required this.getCartsUC}) : super(CartsInitial());

  final GetCartsUC getCartsUC;

  Future<void> getCarts() async {
    emit(CartsDataLoading());
    final getCartsFailedOrSuccess =
        await getCartsUC(const GetGetCartsParams(offset: 0));
    getCartsFailedOrSuccess.fold(
      (l) {
        final failure = l as GeneralFailure;
        emit(CartsDataFailed(error: failure.error));
        debugPrint("Error: ${failure.error}");
      },
      (r) {
        debugPrint("Data: ${r.length}");
        emit(CartsDataLoaded(cartsList: r));
      },
    );
  }

  Future<List<CartModel>> getMoreProducts({required int offset}) async {
    final getCartsFailedOrSuccess =
        await getCartsUC(GetGetCartsParams(offset: offset));
    if (getCartsFailedOrSuccess.isRight()) {
      try {
        final list = getCartsFailedOrSuccess
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
