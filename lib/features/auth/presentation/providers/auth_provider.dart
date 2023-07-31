import 'package:flutter/material.dart';
import 'package:shopp/core/error/exceptions.dart';
import 'package:shopp/features/auth/data/model/user_model.dart';
import 'package:shopp/features/auth/data/repositories/auth_repository.dart';

enum Status { uinitialized, authenticated, authenticating, unauthenticated, error}

class AuthProvider with ChangeNotifier {
  AuthRepository authRepository;

  Status status = Status.uinitialized;
  UserModel? userModel;
  String? error;

  AuthProvider({required this.authRepository});

  /// first check if the user is logged in
  /// if logged in, get the user data
  /// if user in admin list, return true
  Future<bool> login(String email, String password) async {
    try {
      status = Status.authenticating;
      notifyListeners();

      userModel = await authRepository.loginWithEmailAndPassword(email, password);

      status = Status.authenticated;
      List<dynamic> admins = await authRepository.getAdmins();
      if (admins.contains(userModel!.email)) {
        return true;
      } else {
        return false;
      }
    } on InternetException {
      status = Status.error;
      error = 'No Internet Connection';
      notifyListeners();
      return false;
    } on Exception catch (e) {
      status = Status.error;
      error = 'Invalid Email or Password\n$e';
      notifyListeners();
      return false;
    }
  }

  /// register user
  /// if user in admin list, return true
  Future<bool> register(String email, String password) async {
    try {
      status = Status.authenticating;
      notifyListeners();

      userModel = await authRepository.registerWithEmailAndPassword(email, password);

      status = Status.authenticated;
      List<dynamic> admins = await authRepository.getAdmins();
      if (admins.contains(userModel!.email)) {
        return true;
      } else {
        return false;
      }
    } on InternetException {
      status = Status.error;
      error = 'No Internet Connection';
      notifyListeners();
      return false;
    } on Exception {
      status = Status.error;
      error = 'Invalid Email or Password';
      notifyListeners();
      return false;
    }
  }

  /// logout user
  Future<void> logout() async {
    try {
      await authRepository.logout();
      status = Status.unauthenticated;
      notifyListeners();
    } on InternetException {
      status = Status.error;
      error = 'No Internet Connection';
      notifyListeners();
    } on Exception {
      status = Status.error;
      error = 'Something went wrong';
      notifyListeners();
    }
  }

  void reset () {
    status = Status.uinitialized;
    notifyListeners();
  }
}
