import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  SearchBox({
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      width: 300.0,
      height: 42.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.blue),
            onPressed: () {
              onSubmitted(controller.text);
            },
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(color: Colors.blue),
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
                border: InputBorder.none,
              ),
              onSubmitted: onSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
