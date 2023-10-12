import 'package:flutter/material.dart';

import '../model/model.dart';
import 'widget.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: ((context, index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ProductCard(
                    product: products[index],
                  ),
                ))),
      ),
    );
  }
}
