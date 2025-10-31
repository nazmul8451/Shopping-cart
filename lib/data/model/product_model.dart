import 'dart:math';

class ProductModel {
  final int id;
  final String title;
  final String body;
  final int userId;
  final double price;

  ProductModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final random = Random();
    return ProductModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
      price: (random.nextDouble() * 1000).roundToDouble(), // random price
    );
  }
}
