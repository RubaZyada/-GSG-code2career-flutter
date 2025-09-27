import 'package:flutter/material.dart';
import 'package:gsg_flutter/routes.dart';
import 'package:gsg_flutter/screens/home.dart';
import 'package:gsg_flutter/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String userCredentialKey = 'usercredential';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

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
                    if (email!.contains("@") && email.contains(".")) {
                      return null;
                    }
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
                    Navigator.pushReplacementNamed(context, Routes.signup);
                  },
                  child: Text(
                    "You dont have account ?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB2BACD),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    _login(context);
                  },
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Login', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
    if (_formKey.currentState!.validate()) {
     await loginUser(emailController.text);
      // If the form is valid, proceed with the login
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(name: emailController.text)));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Please fix the errors in red before submitting.'),
        ),
      );
    }
  }
  ///1-
  loginUser(String email)async{
    final prefs = await SharedPreferences.getInstance();
     prefs.setString(Login.userCredentialKey, email);
  }
}
