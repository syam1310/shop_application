import 'package:flutter/material.dart';
import 'package:shop_app_ui/product_details.dart';
import 'package:shop_app_ui/product_service.dart';
import 'home_screen.dart'; // Import all screens that you want to navigate to

class AppRouter {
  static const String homeRoute = '/';
  static const String productDetailsRoute = '/product-details';
  static const String productDetailsByType = "/product-details-type";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
