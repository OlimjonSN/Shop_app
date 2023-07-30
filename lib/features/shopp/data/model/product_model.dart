class ProductModel {
  final int price;
  final String categoryId;
  final String productId;
  final String productName;
  final String description;
  final String imageUrl;
  final String createdAt;

  ProductModel({
    required this.price,
    required this.categoryId,
    required this.productId,
    required this.productName,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      price: json['price'],
      categoryId: json['categoryId'],
      productId: json['productId'],
      productName: json['productName'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'categoryId': categoryId,
      'productId': productId,
      'productName': productName,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }
}
