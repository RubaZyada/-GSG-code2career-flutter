import 'package:flutter/material.dart';
import 'package:gsg_flutter/routes.dart';
import 'package:gsg_flutter/screens/freelanser_details.dart';
import 'package:gsg_flutter/screens/home.dart';
import 'package:gsg_flutter/screens/login.dart';
import 'package:gsg_flutter/screens/main_app.dart';
import 'package:gsg_flutter/screens/signup.dart';
//import 'package:gsg_flutter/screens/signup.dart';
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
      routes: {
        Routes.login: (context) => Login(),
        Routes.home: (context) => Home(),
        Routes.signup: (context) => Signup(),
        Routes.main: (context) => MainApp(),
        Routes.freelancerDetails: (context) => FreelancerDetails(),
      },
      home: Login(),
    
    );
    
  }
}

