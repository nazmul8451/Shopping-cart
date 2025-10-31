import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shoping_cart/data/model/product_model.dart';
//ekhane ami ja ja korbo

//  1. api call dibo response pabo
//  2. Product list Store korabo
//  3. cart list store korabo
//  4.total price calculate kore pelbo

class ProductController extends ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> _cart = [];

  List<ProductModel> get products => _products;
  List<ProductModel> get cart => _cart;

  Future<void> getData() async {
    var baseUrl = 'https://jsonplaceholder.typicode.com/posts';
    Uri uri = Uri.parse(baseUrl);

    final response = await get(uri);

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body) as List;
      print(decodedData);
      _products = decodedData
          .map((item) => ProductModel.fromJson(item))
          .toList();
      notifyListeners();
    }
  }
  //add basket item method;
void addToCart(ProductModel item){
    _cart.add(item);
    notifyListeners();
}

void removeFromCart(ProductModel item) {
    _cart.remove(item);
    notifyListeners();
}




}
