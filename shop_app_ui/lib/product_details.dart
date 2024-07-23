import 'package:flutter/material.dart';
import 'package:shop_app_ui/api_service.dart';
import 'package:shop_app_ui/product.dart';

class ProductDetails {
  void showProductDetails(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(product.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Description: ${product.description}'),
              SizedBox(height: 8),
              Text('Type: ${product.type}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}