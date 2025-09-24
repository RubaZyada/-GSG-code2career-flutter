import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:gsg_flutter/data/product_model.dart';
import 'package:gsg_flutter/widgets/prouduct.dart';

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
  void initState() {
    super.initState();           // <-- important
    fetchData();
  }

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
                    itemBuilder: (context, i) => Prouduct(model: products[i]),
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

  Future<void> fetchData() async {
    try {
      final res = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (res.statusCode != 200) {
        throw Exception('HTTP ${res.statusCode}');
      }

      final List<dynamic> data = jsonDecode(res.body);
      log('items: ${data.length}');               

      final list = data
          .map((e) => ProductModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      if (!mounted) return;
      setState(() {
        products = list;                          
        loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        error = 'Failed to load products: $e';
        loading = false;
      });
    }
  }
}
