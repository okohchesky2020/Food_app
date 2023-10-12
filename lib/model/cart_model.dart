import 'package:equatable/equatable.dart';

import 'model.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});
  Map productQuality(products) {
    //this functions ensures we dont have two products sitting differently on the Cart screen
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 30) {
      return 0;
    } else {
      return 10;
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30) {
      return 'You have free delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add #${missing.toStringAsFixed(2)}';
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);
  String get deliveryfeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freedeliveryString => freeDelivery(subtotal);

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}
