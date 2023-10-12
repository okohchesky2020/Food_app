import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<StartCart>(_onStartCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
  }

  void _onStartCart(StartCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(Duration(seconds: 2));
      emit(CartLoaded());
    } catch (_) {
      CartError();
    }
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    if (this.state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from((this.state as CartLoaded).cart.products)
                  ..add(event.product))));
      } catch (_) {
        CartError();
      }
    }
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from((state as CartLoaded).cart.products)
                  ..remove(event.product))));
      } catch (_) {
        CartError();
      }
    }
  }
}
