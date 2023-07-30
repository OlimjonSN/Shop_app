class CategoryModel {
  String categoryName;
  String description;
  String imageUrl;
  String createdAt;

  CategoryModel({
    required this.categoryName,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryName: json['categoryName'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }
}
