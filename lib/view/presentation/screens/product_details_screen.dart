import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_cart/data/service/product_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int index;

  ProductDetailsScreen({super.key, required this.index});

  static const String name = 'product-details-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<ProductController>(
          builder: (context, controller, child) {
            final productImg = controller.images.productImage[index];
            final product = controller.products[index];
            return Column(
              children: [
                Container(
                  height: 300,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Image.network(productImg),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Description: ${product.body}",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(
                              height: 23,
                              width: 23,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                  
                            SizedBox(width: 10),
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 23,
                              width: 23,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Price: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xD6D0A59C),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Total',style: TextStyle(fontSize: 16,color: Colors.black),),
                              Text('234231')
                            ],
                          ),
                        ),
                      ),
                      
                      TextButton(
                          onPressed:(){}, child: Text('Add To Cart',style: TextStyle(color: Colors.black),))
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}