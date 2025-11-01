import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shoping_cart/data/images/product_img.dart';
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
  ProductImg images = ProductImg();

  Future<void> getData() async {
    var baseUrl = 'https://jsonplaceholder.typicode.com/posts';
    Uri uri = Uri.parse(baseUrl);

    final response = await get(uri);

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body) as List;
      print(decodedData);
      _products = decodedData
          .asMap()
          .entries
          .map((entry) => ProductModel.fromJson(entry.value, entry.key, images))
          .toList();

      notifyListeners();
    }
  }
  //add basket item method;
  void addToCart(ProductModel product) {
    final index = _cart.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      _cart[index].quantity++;
    } else {
      product.quantity = 1;
      _cart.add(product);
    }
    notifyListeners();
  }
void increaseQuantity (ProductModel item){
    final index = cart.indexWhere((item)=> item.id == item.id) ;
    if(index!= -1){
      _cart[index].quantity++;
      notifyListeners();
    }
}
  void decreaseQuantity (ProductModel item){
    final index = cart.indexWhere((item)=> item.id == item.id) ;
    if(index!= -1 && _cart[index].quantity>1){
      _cart[index].quantity--;
      notifyListeners();
    }
  }

void removeFromCart(ProductModel item) {
    _cart.remove(item);
    notifyListeners();
}
//total price calculate

double get totalPrice{
    double total = 0.0;
    for(var item in _cart){
      total += item.price * item.quantity;
    }
    return total;
}




}
