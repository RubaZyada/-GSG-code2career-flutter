//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_flutter/routes.dart';
import 'package:gsg_flutter/screens/home.dart';
import 'package:gsg_flutter/screens/signup.dart';
import 'package:gsg_flutter/widgets/custom_text_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), backgroundColor: Color(0xFFB2BACD)),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/login1.jpg", height: 200),
                SizedBox(height: 10),
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
                  cont: passwordController,
                  validat: (password) {
                    if (password!.length >= 8) return null;
                    return 'Please enter at least 8 characters';
                  },
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.signup,
                    );
                  },
                  child: Text(
                    "You dont have account ?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // minimumSize: const Size(120, 40),
                    backgroundColor: Color(0xFFB2BACD),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    _login(context);
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text(
                    //       '${emailController.text}, ${passwordController.text}',
                    //     ),
                    //   ),
                    // );
                    // emailController.clear();
                    // passwordController.clear();
                  },
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed with the login
      Navigator.pushReplacementNamed(context, Routes.home);
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
