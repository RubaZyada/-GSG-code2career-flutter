//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_flutter/routes.dart';
//import 'package:gsg_flutter/screens/login.dart';
import 'package:gsg_flutter/widgets/custom_text_field.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup'), backgroundColor: Color(0xFFB2BACD)),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
            //  scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/login1.jpg", height: 200),
                  SizedBox(height: 10),
                  
                  CustomTextField(
                    hintText: "Name",
                    cont: nameController,
                    validat: (name) {
                      if (name == null || name.isEmpty) {
                        return 'Please enter your name';
                      } else if (name.length < 3) {
                        return 'Name must be at least 3 characters long';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    hintText: "Email",
                    prefixIcon: Icons.email,
                    cont: emailController,
                    validat: (email) {
                      if (email!.contains("@") && email.contains("."))
                        return null;
                      return 'Please enter a valid email';
                    },
                  ),
                  CustomTextField(
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.remove_red_eye,
                    isPassword: true,
                    cont: confirmPassController,
                    validat: (password) {
                      if (password!.length >= 8) return null;
                      return 'Please enter at least 8 characters';
                    },
                  ),
                  CustomTextField(
                    hintText: "confirm Password",
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.remove_red_eye,
                    isPassword: true,
                    cont: passwordController,
                    validat: (confirmPassword) {
                      if (confirmPassword == passwordController.text) return null;
                      return 'Passwords do not match';
                    },
                  ),
                  CustomTextField(
                    hintText: "Phone number",
                    prefixIcon: Icons.phone,
                    cont: phoneController,
                    validat: (phone) {
                      if (phone!.length == 10) return null;
                      return 'Please enter a valid phone number';
                    },
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.login,
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
                    onPressed: () {
                      _signup(context);
                    },
                    child: Text('Signup', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _signup(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed with the login
      Navigator.pushReplacementNamed(context, Routes.home, arguments: nameController.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
           backgroundColor: Colors.red,
          content: Text('Please fix the errors in red before submitting.'),
        ),
      );
    }
  }
}
