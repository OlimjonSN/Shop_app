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

import 'core/firebase_options.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuth auth = FirebaseAuth.instanceFor(app: app);
  final FirebaseStorage storage = FirebaseStorage.instanceFor(app: app);

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      networkInfo: sl(),
      authLocalData: sl(),
      authRemoteData: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteData>(
    () => AuthRemoteData(firebaseAuth: sl(), firebaseStorage: sl()),
  );

  sl.registerLazySingleton<AuthLocalData>(
    () => AuthLocalData(sharedPreference: sl()),
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
