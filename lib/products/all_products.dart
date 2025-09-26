import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/product_model.dart';
import 'package:gsg_flutter/products/product_widget.dart';
import 'package:http/http.dart' as http;

class AllProducts extends StatefulWidget {
  AllProducts({super.key});

  @override
  State<AllProducts> createState() => _MainAppState();
}

class _MainAppState extends State<AllProducts> {
  int index = 0;
  List<Widget> screens = [Text("Home"), Text("cart"), Text("settings")];

  List<ProductModel> products = [];
  bool loading = true;
  String? error;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
        child: loading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductWidget(model: product);
                },
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

  Future<void> fetchData() async {
    try {
      final res = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
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
