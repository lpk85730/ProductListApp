import 'package:product_list_app/injection_container/injection_container.dart';
import 'package:product_list_app/injection_container/injection_container_imports.dart';

class InjectableRepositories {
  InjectableRepositories.inject() {
    sl
      ..registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(
          productRemoteDataSource: sl<ProductRemoteDataSource>(),
        ),
      )
      ..registerLazySingleton<CartsRepository>(
        () => CartsRepositoryImpl(
          cartsRemoteDataSource: sl<CartsRemoteDataSource>(),
        ),
      );
  }
}
