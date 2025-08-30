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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://cdn-icons-png.freepik.com/512/295/295128.png",
              height: 200,
            ),
            SizedBox(height: 10),
            CustomTextField(
              hintText: "Email",
              prefixIcon: Icons.email,
              cont: emailController,
            ),
            SizedBox(height: 10),
            CustomTextField(
              hintText: "Password",
              prefixIcon: Icons.lock,
              isPassword: true,
              cont: passwordController,
            ),
            SizedBox(height: 10),

            ElevatedButton(
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
              child: Text('Login'),
            ),
          ],
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
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => Home()),
      );
    }
  }
}
