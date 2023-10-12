import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import '../model/model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPosition = 5,
      this.isWishList = false});
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;
  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: widthValue - 5 - leftPosition,
            height: 150,
            child: Image.network(product.imageUrl, fit: BoxFit.cover),
          ),
          Positioned(
              left: leftPosition,
              top: 60,
              child: Container(
                width: widthValue,
                height: 80,
                decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              )),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
                width: widthValue - 20 - leftPosition,
                height: 70,
                decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              )
                            ]),
                      ),
                      Expanded(child: BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                        if (state is CartLoading) {
                          return CircularProgressIndicator();
                        }
                        if (state is CartLoaded) {
                          return IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(AddToCart(product));
                                Navigator.pushNamed(context, '/cart');
                              },
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ));
                        } else {
                          return Text('something went wrong');
                        }
                      })),
                      isWishList
                          ? Expanded(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  )))
                          : SizedBox()
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
