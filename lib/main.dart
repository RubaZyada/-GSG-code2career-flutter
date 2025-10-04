import 'package:flutter/material.dart';
import 'package:gsg_flutter/products/main_nav_screen.dart';
import 'package:gsg_flutter/routes.dart';
import 'package:gsg_flutter/screens/freelanser_details.dart';
import 'package:gsg_flutter/screens/home.dart';
import 'package:gsg_flutter/screens/login.dart';
import 'package:gsg_flutter/screens/main_app.dart';
import 'package:gsg_flutter/todo/data/notes_shared_db.dart';
import 'package:gsg_flutter/todo/data/notes_sqlite_db.dart';
import 'package:gsg_flutter/todo/presentaion/screens/notes.dart';
import 'package:gsg_flutter/screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  // استدعي هدا السطر عشان ال async in main
  WidgetsFlutterBinding.ensureInitialized();
 await NotesSharedDb.init();
 await NotesSqliteDb.init();
 // final prefs = await SharedPreferences.getInstance();
 // String? userEmail = prefs.getString(Login.userCredentialKey);
  //runApp(const MyApp());
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.login: (context) => Login(),
        Routes.home: (context) => Home(),
        Routes.signup: (context) => Signup(),
        Routes.main: (context) => MainApp(),
        Routes.freelancerDetails: (context) => FreelancerDetails(),
        Routes.mainNavScreen: (context) => MainNavScreen(),
        
      },
      //shared preferences
      // home: userEmail != null ? Home(name: userEmail,) : Login(),
      //note screen
    //  home: userEmail != null ? NotesScreen() : Login(),
      home: NotesScreen(),
      //counter screen
      //home: CounterScreen(),
      //product  screen
      //home: AllProducts(),
    ),
  );
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//         Routes.login: (context) => Login(),
//         Routes.home: (context) => Home(),
//         Routes.signup: (context) => Signup(),
//         Routes.main: (context) => MainApp(),
//         Routes.freelancerDetails: (context) => FreelancerDetails(),
//         Routes.mainNavScreen: (context) => MainNavScreen(),
//       },
//     home: userEmail!= null ? Home(name: userEmail,) : Login(),  
//     );
//   }
// }

