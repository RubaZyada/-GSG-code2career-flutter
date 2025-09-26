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

  List<ProductModel> products = [];

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
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ProductWidget(model: products[index]);
          },
          itemCount: products.length,
        ),
      ),

    );
  }

  fetchData() async {
    var response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    log(response.body); // json(string)
    var data = jsonDecode(response.body); // decoding
    // [{}] -> [ model ]
    for (Map map in data) {
      ProductModel model = ProductModel.fromJson(map);
      setState(() {
        products.add(model);
      });
    }
  }
}
/**Future<void> fetchData() async {
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
 */