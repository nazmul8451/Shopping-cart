import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_cart/data/service/product_controller.dart';

class Staggered_GridView extends StatelessWidget {
  final List<double> heightPattern = [280, 250];

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: Consumer<ProductController>(
        builder:(context,controller,child) {
        return  MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            itemCount: controller.products.length,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = controller.products[index];
              double height = heightPattern[index % heightPattern.length];
              bool hasDiscount = height == 280;
              return Container(
                height: heightPattern[index % heightPattern.length],
                // আলাদা height
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage('')),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xE6F1CCC3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [
                            //ei item e jodi discount thake tahole badge dekhabe ekta
                            if(hasDiscount)
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(8),

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: const Text('20% OFF',
                                      style: TextStyle(color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800),),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        item.title,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$453.34", style: TextStyle(fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFA600)),),
                          GestureDetector(
                            onTap: (){
                              controller.addToCart(item);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to cart')));
                            },
                            child: Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFA600),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(child: Icon(
                                Icons.add, size: 15, color: Colors.white,),),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior{
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ){
    return child;
  }
}
