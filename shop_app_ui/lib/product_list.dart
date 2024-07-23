import 'package:flutter/material.dart';
import 'package:shop_app_ui/product_details.dart';
import 'product.dart';
import 'api_service.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<Product>> futureProducts;
  int selectedIndex = -1; // Track selected index

  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    futureProducts = apiService.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    ProductDetails productDetails = ProductDetails();
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Product>>(
          future: futureProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> products = snapshot.data!;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  Product product = products[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update selected index
                      });
                      productDetails.showProductDetails(context, product);
                    },
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16.0),
                        leading: Hero(
                          tag: 'product-image-${product.id}',
                          child: const CircleAvatar(
                            radius: 30,
                           backgroundImage: NetworkImage("https://th.bing.com/th/id/R.c1eb69ed2eaa96876b36d9b7f23218f3?rik=WXdHvzz9l4hMJg&riu=http%3a%2f%2fbusiness-review.eu%2fwp-content%2fuploads%2f2017%2f08%2fAccessorize.jpg&ehk=Wm%2fAuo1ffLAskwe1NbLmwYAqdubQjLUbUOsJeyLoanA%3d&risl=&pid=ImgRaw&r=0"),
                          ),
                        ),
                        title: Text(
                          product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 8.0),
                            Text(
                              'Created At: ${product.createdAt}',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        trailing: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
