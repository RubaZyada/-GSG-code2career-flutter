
import 'package:flutter/material.dart';

import 'package:gsg_flutter/data/product_model.dart';
import 'package:gsg_flutter/products/product_widget.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int index = 0;
  List<ProductModel> products = [];
  bool loading = true;
  String? error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : error != null
                ? Text(error!)
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, i) => ProductWidget(model: products[i]),
                  ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), activeIcon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.menu_book), label: 'Books'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }


}