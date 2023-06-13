import 'package:product_list_app/injection_container/injection_container.dart';
import 'package:product_list_app/injection_container/injection_container_imports.dart';

class InjectableCubits {
  InjectableCubits.inject() {
    sl
      ..registerFactory(CheckInternetCubit.new)
      ..registerFactory(
        () => ProductsCubit(getProductsUC: sl<GetProductsUC>()),
      )
      ..registerFactory(
        () => CartsCubit(getCartsUC: sl<GetCartsUC>()),
      );
  }
}
