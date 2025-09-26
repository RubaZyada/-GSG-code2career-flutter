import 'package:flutter/material.dart';
import 'package:gsg_flutter/products/all_products.dart';


class MainNavScreen extends StatefulWidget {
  MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainAppState();
}

class _MainAppState extends State<MainNavScreen> {
  int index = 0;
  List<Widget> screens = [AllProducts(), Text("cart"), Text("settings")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
        backgroundColor: Colors.amber,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Center(
        child: screens[index]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_2_outlined),
            label: "Cart",
            activeIcon: Icon(Icons.shop_2),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            activeIcon: Icon(Icons.settings_cell_outlined),
          ),
        ],
      ),
    );
  }

}
