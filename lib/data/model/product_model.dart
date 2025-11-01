import 'dart:math';

import 'package:shoping_cart/data/images/product_img.dart';

class ProductModel {
  final int id;
  final String title;
  final String body;
  final int userId;
  final double price;
  final String imageUrl;
  int quantity;

  ProductModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  // DB তে রাখার জন্য map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'userId': userId,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
    };
  }

  // DB থেকে ফেরত map থেকে object
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] is int ? map['id'] : int.parse(map['id'].toString()),
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      userId: map['userId'] is int ? map['userId'] : int.parse(map['userId'].toString()),
      price: map['price'] is double ? map['price'] : double.parse(map['price'].toString()),
      imageUrl: map['imageUrl'] ?? '',
      quantity: map['quantity'] ?? 1,
    );
  }

  factory ProductModel.fromJson(
      Map<String, dynamic> json, int index, ProductImg images) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
      price: (Random().nextDouble() * 1000).roundToDouble(),
      imageUrl: images.productImage[index % images.productImage.length],
    );
  }

}
