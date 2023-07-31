import 'package:shopp/core/network/network_info.dart';
import 'package:shopp/features/auth/data/datasource/auth_local_data.dart';
import 'package:shopp/features/auth/data/datasource/auth_remote_data.dart';
import 'package:shopp/features/auth/data/model/user_model.dart';

import '../../../../core/error/exceptions.dart';

class AuthRepository {
  NetworkInfo networkInfo;
  AuthRemoteData authRemoteData;
  AuthLocalData authLocalData;

  AuthRepository({
    required this.networkInfo,
    required this.authRemoteData,
    required this.authLocalData,
  });

  /// logins with email and password
  /// and returns a future of user model
  Future<UserModel> loginWithEmailAndPassword(String email, String password) async {
    // check if there is internet connection
    if (await networkInfo.isConnected) {
      // login with email and password
      UserModel userModel = await authRemoteData.signInWithEmailAndPassword(email, password);
      // save user model
      await authLocalData.saveUserModel(userModel);
      // return user model
      return userModel;
    } else {
      throw InternetException();
    }
  }

  /// registers with email and password
  /// and returns a future of user model
  Future<UserModel> registerWithEmailAndPassword(String email, String password) async {
    // check if there is internet connection
    if (await networkInfo.isConnected) {
      // register with email and password
      UserModel userModel = await authRemoteData.createUserWithEmailAndPassword(email, password);
      // save user model
      await authLocalData.saveUserModel(userModel);
      // return user model
      return userModel;
    } else {
      throw InternetException();
    }
  }

  /// logouts user
  Future<void> logout() async {
    // check if there is internet connection
    if (await networkInfo.isConnected) {
      // logout user
      await authRemoteData.signOut();
      // remove user model from shared preferences
      await authLocalData.sharedPreference.remove('userModel');
    } else {
      throw InternetException();
    }
  }

  Future<List<String>> getAdmins() async {
    // check if there is internet connection
    if (await networkInfo.isConnected) {
      // get admins
      List<String> admins = await authRemoteData.getAdmins();
      // return admins
      return admins;
    } else {
      throw InternetException();
    }
  }

}