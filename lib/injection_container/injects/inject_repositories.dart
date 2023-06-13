import 'package:product_list_app/injection_container/injection_container.dart';
import 'package:product_list_app/injection_container/injection_container_imports.dart';

class InjectableRepositories {
  InjectableRepositories.inject() {
    // sl.registerLazySingleton<AuthRepository>(
    //   () =>
    //       AuthRepositoryImpl(authRemoteDataSource: sl<AuthRemoteDataSource>()),
    // );
  }
}
