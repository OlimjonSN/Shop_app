import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp/features/shopp/data/model/product_model.dart';

class ShoppLocalDatasource {
  SharedPreferences sharedPreferences;

  ShoppLocalDatasource({required this.sharedPreferences});

  /// Cache the list of categories
  Future<void> cacheCategories(List<String> categories) async {
    await sharedPreferences.setStringList('categories', categories);
  }

  /// Cache the list of products by product name
  Future<void> cacheProductsByProductName(String categoryName, List<ProductModel> products) async {
    await sharedPreferences.setStringList(categoryName, products.map((e) => jsonEncode(e.toJson())).toList());
  }

  /// Gets the list of categories
  Future<List<String>> getCategories() async {
    return sharedPreferences.getStringList('categories') ?? [];
  }

  /// Gets the list of products by category name
  Future<List<ProductModel>> getProducts(String categoryName) async {
    List<String> products = sharedPreferences.getStringList(categoryName) ?? [];

    return products.map((e) => ProductModel.fromJson(jsonDecode(e))).toList();
  }

  /// Gets all the products
  Future<List<ProductModel>> getAllProducts() async {
    List<String> categories = await getCategories();

    List<ProductModel> products = [];

    for (String category in categories) {
      products.addAll(await getProducts(category));
    }

    return products;
  }

  /// Gets the product by product name
  Future<ProductModel> getProduct(String categoryName, String productName) async {
    List<ProductModel> products = await getProducts(categoryName);

    return products.firstWhere((element) => element.productName == productName);
  }
}