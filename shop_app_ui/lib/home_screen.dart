import 'package:flutter/material.dart';
import 'package:shop_app_ui/login_dialog_box.dart';
import 'drawer_widget.dart'; // Import the AppDrawer class
import 'product_list.dart';
import 'search_box.dart'; // Import the SearchBox widget
import 'login_button.dart';// Import the LoginDialog widget

class HomeScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  void _performSearch(String query) {
    print('Searching for: $query');
    // Implement your search logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Shop Application'),
        actions: [
          SearchBox(
            controller: _searchController,
            onSubmitted: _performSearch,
          ),
          LoginButton(
            onPressed: () {
              _showLoginDialog(context); // Show login dialog
            },
          ),
        ],
      ),
      drawer: AppDrawer(
        drawerWidth: 250.0,
      ),
      body: ProductList(),
    );
  }

  Future<void> _showLoginDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return LoginDialogboxPage();
      },
    );
  }
}
