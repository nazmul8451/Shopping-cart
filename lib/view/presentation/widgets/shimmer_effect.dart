import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  final double height;
  final bool hasDiscount;

  const ProductShimmer({Key? key, this.height = 280, this.hasDiscount = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 5),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 80,
                height: 20,
                color: Colors.white,
              ),
            ),
            if (hasDiscount)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.redAccent,
                  highlightColor: Colors.red[200]!,
                  child: Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
