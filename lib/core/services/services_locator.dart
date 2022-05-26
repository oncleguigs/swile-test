import 'package:get_it/get_it.dart';
import 'package:swile_test_technique/core/services/api/api.dart';
import 'package:swile_test_technique/core/services/api/api_technical_test_implementation.dart';
import 'package:swile_test_technique/core/services/local_storage/local_storage.dart';
import 'package:swile_test_technique/core/services/local_storage/shared_preferences_implementation.dart';
import 'package:swile_test_technique/core/viewModels/main_model.dart';
import 'package:swile_test_technique/core/viewModels/transactions_view_model.dart';

///////////////////////// SERVICE LOCATOR //////////////////////////
/// This is the service locator that will be used to inject the services

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // /!\ The order of declaration is important in case of inter dependencies /!\

  // First declare all your services which remains consistent all over the app use

  serviceLocator.registerLazySingleton<LocalStorage>(() => SharedPreferencesImplementation());
  serviceLocator.registerLazySingleton<Api>(() => ApiTechnicalTestImplementation());
  serviceLocator.registerLazySingleton<TransactionsViewModel>(() => TransactionsViewModel());

  // Then declare the services which  will be created at each call / view opening
  serviceLocator.registerFactory<MainModel>(() => MainModel());
}
