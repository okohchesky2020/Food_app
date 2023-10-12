import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/bloc/wishlist_bloc.dart';
import 'package:food_app/widget/widget.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  const WishListScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) {
          return const WishListScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Wishlist'),
      body: BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
        if (state is WishlistLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is WishlistLoaded) {
          return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 2.4),
              itemCount: state.wishlist.products.length,
              itemBuilder: ((BuildContext context, int index) {
                return Center(
                    child: ProductCard(
                  product: state.wishlist.products[index],
                  widthFactor: 2.2,
                  leftPosition: 100,
                  isWishList: true,
                ));
              }));
        } else {
          return const Text('something went wrong');
        }
      }),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
