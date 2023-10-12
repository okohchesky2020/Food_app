import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/model/wishlist_model.dart';

import '../model/model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishList>(_mapStartWishListToState);

    on<AddWishListProduct>(_mapAddWishListProductToState);

    on<RemoveWishListProduct>(_mapRemoveWishListProductToState);
  }
  void _mapStartWishListToState(
      StartWishList event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      emit(WishlistLoaded(wishlist: WishList(products: Product.products)));
    } catch (_) {
      WishlistError();
    }
  }

  void _mapAddWishListProductToState(
      AddWishListProduct event, Emitter<WishlistState> emit) async {
    // final currentstate = state;
    if (this.state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishlist: WishList(
                products:
                    List.from((this.state as WishlistLoaded).wishlist.products)
                      ..add(event.product))));
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  void _mapRemoveWishListProductToState(
      RemoveWishListProduct event, Emitter<WishlistState> emit) async {
    // final currentstate = state;
    if (this.state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishlist: WishList(
                products:
                    List.from((this.state as WishlistLoaded).wishlist.products)
                      ..remove(event.product))));
      } on Exception {
        emit(WishlistError());
      }
    }
  }
}


   /* on<StartWishList>((event, emit) 
    
    async {
      emit(WishlistLoading());
      try {
        await Future<void>.delayed(Duration(seconds: 1));
      } catch (_) {}
      emit(const WishlistLoaded());
    });

    on<AddWishListProduct>((event, emit) async {
      if (state is WishlistLoaded) {
      
        try {
          WishlistLoaded(
              wishlist: WishList(
                  products: List.from(state.wishlist.product)
                    ..add(event.product)));
        } catch (_) {}
      }
      emit(state);
    });

    on<RemoveWishListProduct>((event, emit) async {
      if (state is WishlistLoaded) {
        try {
          WishlistLoaded(
              wishlist: WishList(
                  products: List.from(state.wishlist.products)
                    ..remove(event.product)));
        } catch (_) {}
      }
      emit(state);
    });
  }
}
*/