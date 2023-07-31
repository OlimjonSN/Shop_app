import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopp/core/error/exceptions.dart';
import 'package:shopp/features/shopp/data/model/product_model.dart';
import 'package:shopp/features/shopp_admin/data/repositories/shopp_admin_repository.dart';

enum ShoppAdminState { initial, loading, loaded, error }

class ShoppAdminProvider with ChangeNotifier {
  ShoppAdminRepository shoppAdminRepository;

  ShoppAdminProvider({required this.shoppAdminRepository});

  ShoppAdminState shoppAdminState = ShoppAdminState.initial;
  String? errorMessage;

  Future<void> addProduct(ProductModel productModel, XFile file) async {
    shoppAdminState = ShoppAdminState.loading;
    notifyListeners();
    try {
      await shoppAdminRepository.addProduct(productModel, file);
      shoppAdminState = ShoppAdminState.loaded;
      notifyListeners();
    } on InternetException {
      shoppAdminState = ShoppAdminState.error;
      errorMessage = 'No internet connection';
      notifyListeners();
    } catch (e) {
      shoppAdminState = ShoppAdminState.error;
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> createCategory(String categoryName) async {
    shoppAdminState = ShoppAdminState.loading;
    notifyListeners();
    try {
      await shoppAdminRepository.createCategory(categoryName);
      shoppAdminState = ShoppAdminState.loaded;
      notifyListeners();
    } on InternetException {
      shoppAdminState = ShoppAdminState.error;
      errorMessage = 'No internet connection';
      notifyListeners();
    } catch (e) {
      shoppAdminState = ShoppAdminState.error;
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  // get products
  Future<void> getProducts(String categoryName) async {
    shoppAdminState = ShoppAdminState.loading;
    notifyListeners();
    try {
      await shoppAdminRepository.getProducts(categoryName);
      shoppAdminState = ShoppAdminState.loaded;
      notifyListeners();
    } on InternetException {
      shoppAdminState = ShoppAdminState.error;
      errorMessage = 'No internet connection';
      notifyListeners();
    } catch (e) {
      shoppAdminState = ShoppAdminState.error;
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  // get categories
  Future<void> getCategories() async {
    shoppAdminState = ShoppAdminState.loading;
    notifyListeners();
    try {
      await shoppAdminRepository.getCategories();
      shoppAdminState = ShoppAdminState.loaded;
      notifyListeners();
    } on InternetException {
      shoppAdminState = ShoppAdminState.error;
      errorMessage = 'No internet connection';
      notifyListeners();
    } catch (e) {
      shoppAdminState = ShoppAdminState.error;
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  // get all products
  Future<void> getAllProducts() async {
    shoppAdminState = ShoppAdminState.loading;
    notifyListeners();
    try {
      await shoppAdminRepository.getAllProducts();
      shoppAdminState = ShoppAdminState.loaded;
      notifyListeners();
    } on InternetException {
      shoppAdminState = ShoppAdminState.error;
      errorMessage = 'No internet connection';
      notifyListeners();
    } catch (e) {
      shoppAdminState = ShoppAdminState.error;
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  // get product
  Future<void> getProduct(String categoryName, String productName) async {
    shoppAdminState = ShoppAdminState.loading;
    notifyListeners();
    try {
      await shoppAdminRepository.getProduct(categoryName, productName);
      shoppAdminState = ShoppAdminState.loaded;
      notifyListeners();
    } on InternetException {
      shoppAdminState = ShoppAdminState.error;
      errorMessage = 'No internet connection';
      notifyListeners();
    } catch (e) {
      shoppAdminState = ShoppAdminState.error;
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
