import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_flutter/screens/login.dart';
//import 'package:gsg_flutter/screens/home.dart';
import 'package:gsg_flutter/widgets/custom_text_field.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup'), backgroundColor: Color(0xFFB2BACD)),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/login1.jpg", height: 200),
              SizedBox(height: 10),
              CustomTextField(
                hintText: "Name",
                // prefixIcon: Icons.n
                cont: emailController,
              ),

              CustomTextField(
                hintText: "Email",
                prefixIcon: Icons.email,
                cont: emailController,
              ),

              CustomTextField(
                hintText: "Password",
                prefixIcon: Icons.lock,
                suffixIcon: Icons.remove_red_eye,
                isPassword: true,
                cont: passwordController,
              ),
              CustomTextField(
                hintText: "confirm Password",
                prefixIcon: Icons.lock,
                suffixIcon: Icons.remove_red_eye,
                isPassword: true,
                cont: passwordController,
              ),
              CustomTextField(
                hintText: "Phone number",
                prefixIcon: Icons.phone,
                cont: phoneController,
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text(
                  "already have account ?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // minimumSize: const Size(120, 40),
                  backgroundColor: Color(0xFFB2BACD),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: Text('Signup', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
