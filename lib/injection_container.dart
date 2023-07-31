// ignore: import_of_legacy_library_into_null_safe

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp/features/auth/data/datasource/auth_local_data.dart';
import 'package:shopp/features/auth/data/datasource/auth_remote_data.dart';
import 'package:shopp/features/auth/data/repositories/auth_repository.dart';
import 'package:shopp/features/auth/presentation/providers/auth_provider.dart';
import 'package:shopp/features/shopp/data/repositories/shopp_repository.dart';
import 'package:shopp/features/shopp/presentation/providers/shopp_provider.dart';

import 'core/firebase_options.dart';
import 'core/network/network_info.dart';
import 'features/shopp/data/datasource/shopp_local_datasource.dart';
import 'features/shopp/data/datasource/shopp_remote_datasource.dart';
import 'features/shopp_admin/data/datasource/shopp_admin_remote_datasource.dart';
import 'features/shopp_admin/data/repositories/shopp_admin_repository.dart';
import 'features/shopp_admin/presentation/providers/shopp_admin_procider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuth auth = FirebaseAuth.instanceFor(app: app);
  final FirebaseStorage storage = FirebaseStorage.instanceFor(app: app);

  // Providers
  sl.registerFactory(
    () => AuthProvider(authRepository: sl()),
  );

  sl.registerFactory(
    () => ShoppProvider(shoppRepository: sl()),
  );

  sl.registerFactory(
    () => ShoppAdminProvider(shoppAdminRepository: sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      networkInfo: sl(),
      authLocalData: sl(),
      authRemoteData: sl(),
    ),
  );

  sl.registerLazySingleton<ShoppRepository>(
    () => ShoppRepository(
      networkInfo: sl(),
      shoppLocalDatasource: sl(),
      shoppRemoteDatasource: sl(),
    ),
  );

  sl.registerLazySingleton<ShoppAdminRepository>(
    () => ShoppAdminRepository(
      networkInfo: sl(),
      shoppLocalDatasource: sl(),
      shoppAdminRemoteDatasource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteData>(
    () => AuthRemoteData(firebaseAuth: sl(), firebaseStorage: sl()),
  );
  sl.registerLazySingleton<AuthLocalData>(
    () => AuthLocalData(sharedPreference: sl()),
  );

  sl.registerLazySingleton<ShoppRemoteDatasource>(
    () => ShoppRemoteDatasource(firebaseStorage: sl()),
  );
  sl.registerLazySingleton<ShoppLocalDatasource>(
    () => ShoppLocalDatasource(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<ShoppAdminRemoteDatasource>(
    () => ShoppAdminRemoteDatasource(firebaseStorage: sl()),
  );

  //! Core
  // sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => storage);
  // sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
