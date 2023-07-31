import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:shopp/features/auth/data/model/user_model.dart';

class AuthRemoteData {
  // accepts firebase instance
  FirebaseAuth firebaseAuth;
  FirebaseStorage firebaseStorage;

  AuthRemoteData({required this.firebaseAuth, required this.firebaseStorage});

  // returns a future of user credential
  Future<UserModel> signInWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    UserModel userModel = UserModel.fromFirebase(userCredential);
    return userModel;
  }

  // returns a future of user credential
  Future<UserModel> createUserWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    UserModel userModel = UserModel.fromFirebase(userCredential);
    return userModel;
  }

  // returns a future of void
  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }

  /// Returns a list of admins
  Future<List<dynamic>> getAdmins() async {
    Reference ref = firebaseStorage.ref().child('admins').child('admins.txt');

    Uint8List? downloadedData = await ref.getData();

    // getData
    String product = utf8.decode(downloadedData ?? Uint8List(0));

    return jsonDecode(product);
  }
}
