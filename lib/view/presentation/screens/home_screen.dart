import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_cart/data/service/product_controller.dart';
import 'package:shoping_cart/view/presentation/screens/my_cart.dart';

import '../widgets/steggared_gridview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String name = 'Home-Screen';

  @override
  Widget build(BuildContext context) {
    final List<double> heightPattern = [210, 167];
    final controller = Provider.of<ProductController>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xD6D0A59C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Shop App'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyCart.name);
                  },
                  icon: const Icon(Icons.shopping_cart_outlined, size: 28),
                ),

                // 🛒 Badge for showing cart item count
                Positioned(
                  right: 4,
                  top: 4,
                  child: Consumer<ProductController>(
                    builder: (context, controller, child) {
                      int count = controller.cart.length; // ধরে নিচ্ছি তোমার cart list এর নাম cartItems

                      if (count == 0) return const SizedBox(); // যদি কিছু না থাকে তাহলে badge দেখাবে না

                      return Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: Center(
                          child: Text(
                            '$count',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],

      ),
      //body part
      body: FutureBuilder(
        future:controller.getData() ,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: Colors.white,),);
          }else if( snapshot.hasError){
            return Center(child: Text('Error'),);
          }else{
            return Consumer<ProductController>(
              builder: (context, controller, child) {
                return controller.products.isEmpty
                    ? const Center(child:Text('No Product Found'))
                    : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(child: Staggered_GridView()),
                    );
              },
            );
          }
        }
        
      ),
    );
  }
}
