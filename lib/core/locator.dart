
import 'package:get_it/get_it.dart';
import 'package:medicatn/core/services/api_service.dart';
import 'package:medicatn/core/services/database_service.dart';

import 'datasource/database_initializer.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DatabaseInitializer());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => ApiService());

}
