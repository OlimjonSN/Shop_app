class OrderModel {
  final int count;
  final int totalPrice;
  final String productId;
  final String orderId;
  final String userId;
  final String createdAt;
  final String productName;
  final String orderStatus;
  final String imgUrl;

  OrderModel({
    required this.count,
    required this.totalPrice,
    required this.productId,
    required this.orderId,
    required this.userId,
    required this.createdAt,
    required this.productName,
    required this.orderStatus,
    required this.imgUrl,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      count: json['count'],
      totalPrice: json['totalPrice'],
      productId: json['productId'],
      orderId: json['orderId'],
      userId: json['userId'],
      createdAt: json['createdAt'],
      productName: json['productName'],
      orderStatus: json['orderStatus'],
      imgUrl: json['imgUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'totalPrice': totalPrice,
      'productId': productId,
      'orderId': orderId,
      'userId': userId,
      'createdAt': createdAt,
      'productName': productName,
      'orderStatus': orderStatus,
      'imgUrl': imgUrl,
    };
  }
}
