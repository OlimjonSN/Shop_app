import 'package:shopp/core/network/network_info.dart';
import 'package:shopp/features/shopp/data/datasource/shopp_local_datasource.dart';
import 'package:shopp/features/shopp/data/datasource/shopp_remote_datasource.dart';

import '../model/product_model.dart';

class ShoppRepository {
  NetworkInfo networkInfo;
  ShoppLocalDatasource shoppLocalDatasource;
  ShoppRemoteDatasource shoppRemoteDatasource;

  ShoppRepository({
    required this.networkInfo,
    required this.shoppLocalDatasource,
    required this.shoppRemoteDatasource,
  });

  /// Gets the product model
  Future<ProductModel> getProduct(String categoryName, String productName) async {
    if (await networkInfo.isConnected) {
      return await shoppRemoteDatasource.getProduct(categoryName, productName);
    } else {
      return await shoppLocalDatasource.getProduct(categoryName, productName);
    }
  }

  /// Gets the list of products by category name
  Future<List<ProductModel>> getProducts(String categoryName) async {
    if (await networkInfo.isConnected) {
      return await shoppRemoteDatasource.getProducts(categoryName);
    } else {
      return await shoppLocalDatasource.getProducts(categoryName);
    }
  }

  /// Gets all the products
  Future<List<ProductModel>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      return await shoppRemoteDatasource.getAllProducts();
    } else {
      return await shoppLocalDatasource.getAllProducts();
    }
  }

  /// Gets the list of categories
  Future<List<String>> getCategories() async {
    if (await networkInfo.isConnected) {
      return await shoppRemoteDatasource.getCategories();
    } else {
      return await shoppLocalDatasource.getCategories();
    }
  }
}
