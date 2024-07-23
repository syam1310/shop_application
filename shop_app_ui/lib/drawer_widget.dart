import 'package:flutter/material.dart';
import 'package:shop_app_ui/product.dart';
import 'package:shop_app_ui/product_service.dart';
import 'api_service.dart';

class AppDrawer extends StatefulWidget {
  final double drawerWidth;

  AppDrawer({this.drawerWidth = 250.0}); // Default width for drawer

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<String> drawerItems = [];
  ApiService apiService = ApiService(); // Initialize ApiService instance

  @override
  void initState() {
    super.initState();
    fetchDrawerItems();
  }

  Future<void> fetchDrawerItems() async {
    try {
      List<String> items = await apiService.fetchDrawerItems();
      setState(() {
        drawerItems = items;
      });
    } catch (e) {
      print('Error fetching drawer items: $e');
    }
  }

  Future<void> fetchProductsAndNavigate(BuildContext context, String type) async {
    try {
      ProductService productService = ProductService();
      ApiService apiService = ApiService();
      List<Product> products = await apiService.fetchProductsByType(type);
      productService.fetchProductsAndShowDialog(context, products);
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: widget.drawerWidth,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              color: Colors.blue,
              child: const Text(
                'Types',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            ...drawerItems.map((type) => ListTile(
                  title: Text(type),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                    fetchProductsAndNavigate(context,
                        type); // Fetch products for the selected type
                  },
                )),
          ],
        ),
      ),
    );
  }
}
