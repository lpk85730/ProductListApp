import 'package:product_list_app/injection_container/injection_container.dart';
import 'package:product_list_app/injection_container/injection_container_imports.dart';

class InjectableUseCases {
  InjectableUseCases.inject() {
    sl
      ..registerLazySingleton(
        () => GetProductsUC(productRepository: sl<ProductRepository>()),
      )
      ..registerLazySingleton(
        () => GetCartsUC(cartsRepository: sl<CartsRepository>()),
      );
  }
}
