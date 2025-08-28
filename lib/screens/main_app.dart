import 'package:flutter/material.dart';
import 'package:gsg_flutter/screens/home.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    
    );
  }
}