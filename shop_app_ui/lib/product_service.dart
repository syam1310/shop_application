import 'package:flutter/material.dart';
import 'package:shop_app_ui/api_service.dart';
import 'package:shop_app_ui/product.dart';
import 'package:shop_app_ui/product_details.dart';

class ProductService {
  Future<void> fetchProductsAndShowDialog(BuildContext context, List<Product> products) async {
    try {
      ProductDetails productDetails = ProductDetails();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Products Types: ${products.isNotEmpty ? products[0].getType : ""}'),
            content: Container(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  Product product = products[index];
                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage("https://th.bing.com/th/id/R.c1eb69ed2eaa96876b36d9b7f23218f3?rik=WXdHvzz9l4hMJg&riu=http%3a%2f%2fbusiness-review.eu%2fwp-content%2fuploads%2f2017%2f08%2fAccessorize.jpg&ehk=Wm%2fAuo1ffLAskwe1NbLmwYAqdubQjLUbUOsJeyLoanA%3d&risl=&pid=ImgRaw&r=0"),
                      ),
                      title: Text(
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      subtitle: Text(
                        'Created At: ${product.createdAt}',
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      onTap: () {
                        productDetails.showProductDetails(context, product);
                      },
                    ),
                  );
                },
              ),
            ),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}
