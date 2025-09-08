import 'package:flutter/material.dart';
import 'package:gsg_flutter/routes.dart';
import 'package:gsg_flutter/widgets/best_booking.dart';
import 'package:gsg_flutter/widgets/build_AppBar.dart';
import 'package:gsg_flutter/widgets/section_header.dart';
import 'package:gsg_flutter/widgets/top_rated_freelancers.dart';
import 'package:gsg_flutter/widgets/top_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    final String? name = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(title: Text("log in"),onTap: (){Navigator.pushReplacementNamed(context, Routes.login);},),
            ListTile(title: Text("sign up"),onTap: (){Navigator.pushReplacementNamed(context, Routes.signup);},),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Color.fromARGB(255, 157, 160, 158),
        child: Icon(Icons.home),
      ),
      appBar: BuildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Text("hello ${name ?? 'Guest'}")),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search here",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 51,
                    height: 49,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFB2BACD)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.sort),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Image.asset(
              "assets/images/Group 780.png",
              width: 390,
              height: 203,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 10),
            SectionHeader(sectionTitle: 'Top Rated Freelances'),
            SizedBox(height: 10),
            TopRatedFreelancers(),
            SizedBox(height: 10),
            SectionHeader(sectionTitle: 'Top Services'),
            TopServices(),
            SizedBox(height: 10),
            SectionHeader(sectionTitle: 'Best booking'),
            BestBooking(),
          ],
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
          BottomNavigationBarItem(icon: Icon(Icons.home),activeIcon: Icon(Icons.home_filled) ,label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        ],
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text('Home button pressed')));
}
