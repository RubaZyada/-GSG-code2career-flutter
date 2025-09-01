import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String ?hintText;
  final IconData ?prefixIcon;
  final IconData ?suffixIcon;
  final bool isPassword;
  final TextEditingController cont;
  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    required this.cont,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 10),
              child: TextField(
                controller: cont,
                obscureText: isPassword,
                decoration: InputDecoration(
                  hintText: hintText,
                  prefixIcon: Icon(prefixIcon),
                  suffixIcon: Icon(suffixIcon),
                  border: OutlineInputBorder(
                   // borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            );
  }
}