import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;
  bool? isEmailVerified;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.image,
    this.isEmailVerified,
  });

  factory UserModel.fromFirebase(UserCredential userCredential) {
    return UserModel(
      name: userCredential.user?.displayName,
      email: userCredential.user?.email,
      phone: userCredential.user?.phoneNumber,
      uId: userCredential.user?.uid,
      image: userCredential.user?.photoURL,
      isEmailVerified: userCredential.user?.emailVerified,
    );
  }


  UserModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'image': image,
      'isEmailVerified': isEmailVerified,
    };
  }


}