import 'package:flutter/material.dart';
import 'package:gsg_flutter/screens/home.dart';
//import 'package:gsg_flutter/screens/main_app.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    
    );
  }
}

