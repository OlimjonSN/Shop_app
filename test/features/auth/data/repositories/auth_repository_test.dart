import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp/core/firebase_options.dart';
import 'package:shopp/core/network/network_info.dart';
import 'package:shopp/features/auth/data/datasource/auth_local_data.dart';
import 'package:shopp/features/auth/data/datasource/auth_remote_data.dart';
import 'package:shopp/features/auth/data/repositories/auth_repository.dart';

// import 'package:mockito/mockito.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthRepository authRepository;

  late NetworkInfo networkInfo;
  late AuthRemoteData authRemoteData;
  late AuthLocalData authLocalData;

  late InternetConnectionChecker connectionChecker;
  late FirebaseAuth firebaseAuth;
  late SharedPreferences sharedPreferences;

  setUp(() async {
    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.web,
    );
    firebaseAuth = FirebaseAuth.instanceFor(app: app);
    connectionChecker = InternetConnectionChecker();

    sharedPreferences = await SharedPreferences.getInstance();

    networkInfo = NetworkInfo(connectionChecker);
    authRemoteData = AuthRemoteData(firebaseAuth: firebaseAuth);
    authLocalData = AuthLocalData(sharedPreference: sharedPreferences);

    authRepository = AuthRepository(
      networkInfo: networkInfo,
      authRemoteData: authRemoteData,
      authLocalData: authLocalData,
    );
  });
  test('Test AuthRepository', () {
    expect(authRepository, isA<AuthRepository>());
  });

  // group('Test AuthRepository', () {
  //   test('Login', () {
  //     expect(authRepository.loginWithEmailAndPassword('example@gmail.com', 'example'), completes);
  //   });
  // });
}
