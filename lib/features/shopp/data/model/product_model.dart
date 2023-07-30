class ProductModel {
  final int price;
  final String categoryName;
  final String productName;
  final String description;
  String imageUrl;
  final String createdAt;

  ProductModel({
    required this.price,
    required this.categoryName,
    required this.productName,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      price: json['price'],
      categoryName: json['categoryName'],
      productName: json['productName'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'categoryName': categoryName,
      'productName': productName,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }
}
