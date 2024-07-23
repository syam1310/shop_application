import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart';

class ApiService {
  final String baseUrl = 'http://localhost:8080/product/all';

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => Product.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<String>> fetchDrawerItems() async {
    final url = Uri.parse('http://localhost:8080/product/types');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<String> drawerItems = data.map((item) => item.toString()).toList();
        return drawerItems;
      } else {
        throw Exception('Failed to load drawer items');
      }
    } catch (e) {
      print('Error fetching drawer items: $e');
      return []; // Return empty list on error
    }
  }

  Future<List<Product>> fetchProductsByType(String type) async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/product/type/$type'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products =
          data.map((item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
