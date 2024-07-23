import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app_ui/ProductDetailsPage.dart';

class LoginDialogboxPage extends StatefulWidget {
  @override
  _LoginDialogboxPageState createState() => _LoginDialogboxPageState();
}

class _LoginDialogboxPageState extends State<LoginDialogboxPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoggedIn = false; // Track login status

  Future<void> _login(String username, String password) async {
    String url = 'http://localhost:8080/login';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, String> body = {
      'username': username,
      'password': password,
    };

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        setState(() {
          _isLoggedIn = true; // Set login status to true
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailsPage()),
        );
        _showLoginDialog("Login Successful");
      } else {
        _showLoginDialog("Login failed");
      }
    } catch (e) {
      _showLoginDialog("Error: $e");
    }
  }

  void _showLoginDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            // Background color of the title bar
            padding: EdgeInsets.all(10.0),
            // child: const Center(
            //   child: Text(
            //     "Login Result",
            //   ),
            // ),
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Login'),
      content: Container(
        width: 170,
        height: 130,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
          ],
        ),
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),  
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text("Cancel"),
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 196, 118, 113)),
          // ),
        ),
        ElevatedButton(
          onPressed: () {
            _login(_usernameController.text, _passwordController.text);
          },
          child: Text('Login'),
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 77, 135, 183)),
          // ),
        ),
      ],
    );
  }
}
