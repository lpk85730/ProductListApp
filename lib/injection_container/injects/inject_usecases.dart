import 'package:product_list_app/injection_container/injection_container.dart';
import 'package:product_list_app/injection_container/injection_container_imports.dart';

class InjectableUseCases {
  InjectableUseCases.inject() {
    // sl.registerLazySingleton(
    //   () => SendOtpUC(authRepository: sl<AuthRepository>()),
    // );
  }
}
