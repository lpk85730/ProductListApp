import 'package:product_list_app/injection_container/injection_container.dart';
import 'package:product_list_app/injection_container/injection_container_imports.dart';

class InjectableDataSources {
  InjectableDataSources.inject() {
    sl
      ..registerLazySingleton<ProductRemoteDataSource>(
        ProductRemoteDataSourceImpl.new,
      )
      ..registerLazySingleton<CartsRemoteDataSource>(
        CartsRemoteDataSourceImpl.new,
      );
  }
}
