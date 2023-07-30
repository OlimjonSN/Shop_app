import 'package:shopp/features/shopp/data/model/product_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shopp/data/repositories/shopp_repository.dart';
import '../datasource/shopp_admin_remote_datasource.dart';

class ShoppAdminRepository extends ShoppRepository {
  ShoppAdminRepository({
    required networkInfo,
    required ShoppAdminRemoteDatasource shoppAdminRemoteDatasource,
    required shoppLocalDatasource,
  }) : super(
          networkInfo: networkInfo,
          shoppRemoteDatasource: shoppAdminRemoteDatasource,
          shoppLocalDatasource: shoppLocalDatasource,
        );

  ///  Adds a product to the database
  Future<void> addProduct(ProductModel productModel, XFile file) async {
    await (shoppRemoteDatasource as ShoppAdminRemoteDatasource).uploadProduct(productModel, file);
  }

  /// Creates a new category
  Future<void> createCategory(String categoryName) async {
    await (shoppRemoteDatasource as ShoppAdminRemoteDatasource).createCategory(categoryName);
  }
}
