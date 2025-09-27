import 'package:flutter/material.dart';
import 'package:gsg_flutter/products/all_products.dart';


class MainNavScreen extends StatefulWidget {
  MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainAppState();
}

class _MainAppState extends State<MainNavScreen> {
  int index = 0;
  List<Widget> screens = [AllProducts(), Text("settings"), Text("settings")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[index]),
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
            icon: Icon(Icons.menu_book_outlined),
            label: "books",
            activeIcon: Icon(Icons.menu_book_sharp),
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
