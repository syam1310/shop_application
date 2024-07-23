import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Required for jsonEncode()

class CreateProductDialog extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Product'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: typeController,
              decoration: InputDecoration(labelText: 'Type'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Save'),
          onPressed: () {
            _saveProduct(context);
          },
        ),
      ],
    );
  }

  Future<void> _saveProduct(BuildContext context) async {
    String name = nameController.text.trim();
    String description = descriptionController.text.trim();
    double price = double.tryParse(priceController.text.trim()) ?? 0.0;
    String type = typeController.text.trim();

    if (name.isEmpty || description.isEmpty || price <= 0 || type.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('All fields are required.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      var url = Uri.parse('http://localhost:8080/product/create');

      var body = {
        'name': name,
        'description': description,
        'price': price.toString(),
        'type': type,
      };

      var bodyJson = jsonEncode(body);

      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyJson,
      );

      if (response.statusCode == 200) {
        // Product created successfully
        Navigator.of(context).pop(); // Close the create product dialog
        // Optionally show a success message or navigate to a different screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product created successfully!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // Handle error scenarios
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to create product. Please try again.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Error: $e');
      // Handle any network or server errors
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred. Please try again later.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
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
}
