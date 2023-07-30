
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteData {
  // accepts firebase instance
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  AuthRemoteData({required this.firebaseAuth});
  
  // returns a future of user credential
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  // returns a future of user credential
  Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async {
    return await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  // returns a future of void
  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }
}