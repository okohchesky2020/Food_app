import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/category_model.dart';
import 'package:food_app/model/model.dart';
import 'package:food_app/widget/widget.dart';

class MyHomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) {
          return MyHomeScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'DOMCORD RESTURANT'),
      body: Column(children: [
        Container(
            child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  scrollDirection: Axis.horizontal,
                ),
                items: Category.categories
                    .map((category) => HeroCarousalCard(
                          category: category,
                        ))
                    .toList())),
        SectionTitle(title: 'RECOMMENDATION'),
        //ProductCard(products: Product.products[0])
        ProductCarousel(
            products: Product.products
                .where((product) => product.isRecommended)
                .toList()),
        SectionTitle(title: 'MOST POPULAR'),
        ProductCarousel(
            products:
                Product.products.where((product) => product.isPopular).toList())
      ]),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
