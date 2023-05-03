import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'dio_helpers/dio_helper.dart';
import 'hive_helper/hive_helper.dart';

final gi = GetIt.instance;

Future<void> initCustomDio() async {
  // Bloc

  // Repository

  // user case

  // Data sources

  //! External

  //! Core
  gi.registerLazySingleton(() => HiveDioHelper());
  gi.registerLazySingleton(() => Dio());
  gi.registerLazySingleton(() => DioHelper());
}
