import 'dart:convert';
import 'dart:io' as io;

import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:shopp/features/shopp/data/datasource/shopp_remote_datasource.dart';
import 'package:shopp/features/shopp/data/model/product_model.dart';

class ShoppAdminRemoteDatasource extends ShoppRemoteDatasource {
  ShoppAdminRemoteDatasource({required firebaseStorage}) : super(firebaseStorage: firebaseStorage);

  /// Uploads Product Model
  Future<UploadTask> uploadProduct(ProductModel productModel, XFile? file) async {
    // before sending the product we need to send image first
    productModel.imageUrl = await uploadFile(file) ?? '';

    Reference ref = firebaseStorage.ref().child('categories').child(productModel.categoryName).child('${productModel.productName}.txt');
    return ref.putString(
      jsonEncode(productModel.toJson()),
      metadata: SettableMetadata(contentLanguage: 'en'),
    );
  }

  Future<String?> uploadFile(XFile? file) async {
    if (file == null) {
      return null;
    }

    UploadTask uploadTask;

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance.ref().child('images').child('/${file.name}');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }

    return await (await uploadTask).ref.getDownloadURL();
  }

  /// Creates a new category
  Future<void> createCategory(String categoryName) async {
    final folderRef = FirebaseStorage.instance.ref().child('categories');

    // Create the folder
    await folderRef.child(categoryName).putString('hello world');
  }
}
