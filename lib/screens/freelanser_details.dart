import 'package:flutter/material.dart';

class FreelancerDetails extends StatelessWidget {
  const FreelancerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(title: Text('Freelancer Details')),
      body: Column(
        children: [
          Text('Details about the freelancer will be shown here.'),
        ],
      ),
    );
  }
}