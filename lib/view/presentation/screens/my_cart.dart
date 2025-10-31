import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_cart/data/service/product_controller.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  static const String name = 'cart-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyCart')),
      body: Consumer<ProductController>(
        builder: (context, controller, child) {
          return ListView.builder(
            itemCount: controller.cart.length,
            itemBuilder: (context, index) {
              final itemCart = controller.cart[index];
              return Container(
                margin: EdgeInsets.all(10),
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(color: Colors.blueGrey),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            itemCart.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$453.34", style: TextStyle(fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFFA600)),),
                              
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(onPressed: (){
                                  controller.removeFromCart(itemCart);
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Removed from cart')));
                                }, icon: Icon(Icons.delete)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
