import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp/features/auth/data/model/user_model.dart';

class AuthLocalData {
  SharedPreferences sharedPreference;

  AuthLocalData({required this.sharedPreference});

  // save user model
  Future<void> saveUserModel(UserModel userModel) async {
    await sharedPreference.setString('userModel', jsonEncode(userModel.toJson()));
  }

  // get user model
  Future<UserModel?> getUserModel() async {
    String? userModelString = sharedPreference.getString('userModel');
    if (userModelString != null) {
      return UserModel.fromJson(jsonDecode(userModelString));
    }
    return null;
  }
}
