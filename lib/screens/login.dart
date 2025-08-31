import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_flutter/screens/home.dart';
import 'package:gsg_flutter/widgets/custom_text_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), backgroundColor: Color(0xFFB2BACD)),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/login1.jpg",
                height: 200,
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: "Email",
                prefixIcon: Icons.email,
                cont: emailController,
              ),
             
              CustomTextField(
                hintText: "Password",
                prefixIcon: Icons.lock,
                isPassword: true,
                cont: passwordController,
              ),
              SizedBox(height: 10),
        
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                // minimumSize: const Size(120, 40),
                  backgroundColor: Color(0xFFB2BACD),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 20, ),
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
                  emailController.clear();
                  passwordController.clear();
                },
                child: Text('Login',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) {
    var email = emailController.text;
    var password = passwordController.text;
    emailController.clear();
    passwordController.clear();
    if (email.isEmpty || password.isEmpty) {
      return ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('enter valid value')));
    } else {
      if
      (email.contains("@") && email.contains(".")&& password.length>=6)
       {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => Home()),
      );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('enter valid email and password')),
        );
      }
    }
  }
}
