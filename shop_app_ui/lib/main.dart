import 'package:flutter/material.dart';
import 'router.dart'; // Import your router class
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.homeRoute, // Set initial route
    );
  }
}
