import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String createdAt;
  final String type;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.type,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      createdAt: json['createdAt'],
      type: json['type'],
    );
  }

  // Getter for id
  int get getId => id;
  
  String get getName => name;
  String get getType => type;
  

  // ToString method
  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, price: $price, createdAt: $createdAt, type: $type}';
  }
}
