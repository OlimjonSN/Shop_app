import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:shopp/features/shopp/data/model/product_model.dart';

class ShoppRemoteDatasource {
  FirebaseStorage firebaseStorage;

  ShoppRemoteDatasource({required this.firebaseStorage});

  /// Gets the product model
  Future<ProductModel> getProduct(String categoryName, String productName) async {
    Reference ref = firebaseStorage.ref().child('categories').child(categoryName).child('$productName.txt');

    String product = await ref.getDownloadURL();

    return ProductModel.fromJson(jsonDecode(product));
  }

  /// Gets the list of products by category name
  Future<List<ProductModel>> getProducts(String categoryName) async {
    Reference ref = firebaseStorage.ref().child('categories').child(categoryName);

    ListResult result = await ref.listAll();

    List<ProductModel> products = [];

    for (Reference ref in result.items) {
      String product = await ref.getDownloadURL();

      products.add(ProductModel.fromJson(jsonDecode(product)));
    }

    return products;
  }

  /// Gets the list of categories
  Future<List<String>> getCategories() async {
    Reference ref = firebaseStorage.ref().child('categories');

    ListResult result = await ref.listAll();

    List<String> categories = [];

    for (Reference ref in result.items) {
      categories.add(ref.name);
    }

    return categories;
  }
}
