class OrderModel {
  final int count;
  final int totalPrice;
  final String productName;
  final String orderName;
  final String userName;
  final String createdAt;
  final String orderStatus;
  final String imgUrl;

  OrderModel({
    required this.count,
    required this.totalPrice,
    required this.productName,
    required this.orderName,
    required this.userName,
    required this.createdAt,
    required this.orderStatus,
    required this.imgUrl,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      count: json['count'],
      totalPrice: json['totalPrice'],
      productName: json['productName'],
      orderName: json['orderName'],
      userName: json['userName'],
      createdAt: json['createdAt'],
      orderStatus: json['orderStatus'],
      imgUrl: json['imgUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'totalPrice': totalPrice,
      'productName': productName,
      'orderName': orderName,
      'userName': userName,
      'createdAt': createdAt,
      'orderStatus': orderStatus,
      'imgUrl': imgUrl,
    };
  }
}
