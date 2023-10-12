import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import '../model/model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  CartProductCard({super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  '#${product.price}',
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(RemoveFromCart(product));
                      },
                      icon: Icon(Icons.remove_circle));
                },
              ),
              Text(
                '$quantity',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(AddToCart(product));
                  },
                  icon: Icon(Icons.add_circle))
            ],
          )
        ],
      ),
    );
  }
}
