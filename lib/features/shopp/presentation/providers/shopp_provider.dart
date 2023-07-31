import 'package:flutter/material.dart';
import 'package:shopp/features/shopp/data/model/order_model.dart';
import 'package:shopp/features/shopp/data/model/product_model.dart';
import 'package:shopp/features/shopp/data/repositories/shopp_repository.dart';

enum ShoppState { initial, loading, loaded, error }

class ShoppProvider with ChangeNotifier {
  ShoppRepository shoppRepository;

  ShoppProvider({required this.shoppRepository});

  ShoppState shoppState = ShoppState.initial;
  String? errorMessage;
  List<ProductModel> products = [];
  List<OrderModel> orders = [];
  List<String> categories = [];

  Future<void> getProducts(String categoryName) async {
    shoppState = ShoppState.loading;
    notifyListeners();
    try {
      products = await shoppRepository.getProducts(categoryName);
      shoppState = ShoppState.loaded;
      notifyListeners();
    } catch (e) {
      shoppState = ShoppState.error;
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> getCategories() async {
    shoppState = ShoppState.loading;
    notifyListeners();
    try {
      categories = await shoppRepository.getCategories();
      shoppState = ShoppState.loaded;
      notifyListeners();
    } catch (e) {
      shoppState = ShoppState.error;
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> getOrders() async {
    shoppState = ShoppState.loading;
    notifyListeners();
    try {
      orders = await shoppRepository.getCarts();
      shoppState = ShoppState.loaded;
      notifyListeners();
    } catch (e) {
      shoppState = ShoppState.error;
      errorMessage = e.toString();
      notifyListeners();
    }
  }

}