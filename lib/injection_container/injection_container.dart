import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:product_list_app/core/services/api_service.dart';
import 'package:product_list_app/injection_container/injects/inject_cubits.dart';
import 'package:product_list_app/injection_container/injects/inject_datasources.dart';
import 'package:product_list_app/injection_container/injects/inject_repositories.dart';
import 'package:product_list_app/injection_container/injects/inject_usecases.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  /// service
  sl.registerLazySingleton<ApiService>(ApiService.new);

  /// Data Sources
  InjectableDataSources.inject();

  /// Repositories
  InjectableRepositories.inject();

  /// Use cases
  InjectableUseCases.inject();

  /// Cubits
  InjectableCubits.inject();
}
