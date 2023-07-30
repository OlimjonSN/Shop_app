import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopp/features/auth/data/model/user_model.dart';

class AuthRemoteData {
  // accepts firebase instance
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  AuthRemoteData({required this.firebaseAuth});

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
}
