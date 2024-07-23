import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  LoginButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 97, 129, 203),
          backgroundColor: Color.fromARGB(255, 229, 231, 232),
        ),
        child: Text('Login'),
      ),
    );
  }
}
