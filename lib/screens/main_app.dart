import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/product_model.dart';
import 'package:gsg_flutter/widgets/prouduct.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int index = 0;
  List<ProductModel> products = [];
  @override
  void initState() {
    fetchData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Prouduct(model: products[index]);
          },
          itemCount: products.length,
        ),
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
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
  fetchData() async {
    var response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"));
    log(response.body);
    var data = jsonDecode(response.body);
    log(data.length); 
    // [{}] --> [model]
    for (Map map in data) {
      ProductModel model = ProductModel.fromJson(map);
      setState(() {
       products.add(model);
      });
    }
  }
}
