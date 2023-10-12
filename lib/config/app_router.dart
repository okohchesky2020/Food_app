import 'package:flutter/material.dart';
import 'package:food_app/model/category_model.dart';
import 'package:food_app/model/model.dart';

import 'package:food_app/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MyHomeScreen.route();
      case '/splash':
        return SplashScreen.route();
      case '/cart':
        return CartScreen.route();
      case '/product':
        return ProductScreen.route(product: settings.arguments as Product);
      case '/wishlist':
        return WishListScreen.route();
      case '/catalog':
        return CatalogScreen.route(
            category: settings.arguments
                as Category); //this help to identify the categoruy screen we are on by giving the appbar the name of the widget
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(title: const Text('error')),
          );
        });
  }
}
