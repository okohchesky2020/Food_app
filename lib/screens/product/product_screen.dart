import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/bloc/wishlist_bloc.dart';
import 'package:food_app/model/model.dart';
import 'package:food_app/widget/widget.dart';

import '../../bloc/cart_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  const ProductScreen({required this.product});
  final Product product;

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) {
          return ProductScreen(
            product: product,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: product.name),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                if (state is WishlistLoading) {
                  return CircularProgressIndicator();
                }
                if (state is WishlistLoaded) {
                  return IconButton(
                      onPressed: () {
                        context
                            .read<WishlistBloc>()
                            .add(AddWishListProduct(product));
                        final snackBar =
                            SnackBar(content: Text('added to ur wishlist'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      icon: const Icon(Icons.favorite, color: Colors.red));
                } else {
                  return const Text('something went wrong');
                }
              }),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<CartBloc>().add(AddToCart(product));

                      Navigator.pushNamed(context, '/cart');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'ADD TO CART',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.black),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            CarouselSlider(
                items: [
                  HeroCarousalCard(
                    product: product,
                  )
                ],
                options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height)),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(5.0),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      '#${product.price}',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            ExpansionTile(
              title: Text(
                'Product Information',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              initiallyExpanded: true,
              children: <Widget>[
                ListTile(
                    title: Text(
                  'description',
                  style: Theme.of(context).textTheme.displaySmall,
                ))
              ],
            ),
            ExpansionTile(
              title: Text(
                'Delivery Information',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              initiallyExpanded: true,
              children: <Widget>[
                ListTile(
                    title: Text(
                  'delivery details',
                  style: Theme.of(context).textTheme.displaySmall,
                ))
              ],
            )
          ],
        ));
  }
}
