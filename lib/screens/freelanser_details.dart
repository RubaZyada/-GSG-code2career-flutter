import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/freelancers_model.dart';
import 'package:gsg_flutter/widgets/rating.dart';

class FreelancerDetails extends StatelessWidget {
  const FreelancerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final freelancer =
        ModalRoute.of(context)!.settings.arguments as FreelancersModel;
    return Scaffold(
      appBar: AppBar(title: Text('Freelancer Details')),
      body: Column(
        children: [
          Image.asset(freelancer.imageUrl),
          Text(freelancer.name),
          Rating(rate: freelancer.rate),
        ],
      ),
    );
  }
}
