import 'package:flutter/material.dart';
import 'package:food_app/widget/widget.dart';

import '../../model/model.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  const CatalogScreen({required this.category});

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) {
          return CatalogScreen(category: category);
        });
  }

  final Category category;
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products.where((product) {
      return product.category == category.name;
    }).toList();

    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemCount: categoryProducts.length,
          itemBuilder: ((BuildContext context, int index) {
            return Center(
                child: ProductCard(
              product: categoryProducts[index],
              widthFactor: 2.2,
            ));
          })),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
