import 'package:flutter/material.dart';
import 'package:gsg_flutter/routes.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget{
  const BuildAppBar({super.key});
 @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Icon(Icons.menu),
        title: Image.asset(
          "assets/images/logo-79.png",
          width: 100,
          height: 100,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.only(right: 5),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 240, 238, 238),
            ),

            child: IconButton(
              hoverColor: Color.fromARGB(255, 240, 238, 238),
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined),
            ),
          ),
            SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.login);
            },
            icon: Icon(Icons.logout),
          ),
          SizedBox(width: 20),
        ],
      );
  }
}