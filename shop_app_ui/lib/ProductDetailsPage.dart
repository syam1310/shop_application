import 'package:flutter/material.dart';
import 'package:shop_app_ui/home_screen.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(labelText: "Product Type"),
            ),
            SizedBox(height: 8),
           TextFormField(
              decoration: InputDecoration(labelText: "Price"),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(labelText: "Description"),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle cancel action
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen())); // Close the current page
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () { // Close the current page
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
