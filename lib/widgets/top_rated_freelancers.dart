// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gsg_flutter/data/freelancers_model.dart';
import 'package:gsg_flutter/widgets/rating.dart';

class TopRatedFreelancers extends StatefulWidget {
  const TopRatedFreelancers({
    super.key,
   // required this.model,
  });
//  final Users model;

  @override
  State<TopRatedFreelancers> createState() => _TopRatedFreelancersState();
}

class _TopRatedFreelancersState extends State<TopRatedFreelancers> {
  List<Users> users = [
    Users(
      imageUrl: "assets/images/models/model1.png",
      name: "John Doe",
      job: "Web Developer",
      rate: 4.5,
    ),
    Users(
      imageUrl: "assets/images/models/model2.png",
      name: "John Doe",
      job: "Web Developer",
      rate: 4.5,
    ),
    Users(
      imageUrl: "assets/images/models/model3.png",
      name: "Jane Smith",
      job: "Graphic Designer",
      rate: 4.7,
    ),
    Users(
      imageUrl: "assets/images/models/model4.png",
      name: "Mike Johnson",
      job: "UI/UX Designer",
      rate: 4.8,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(users.length, (index) {
            final user = users[index];
            return Container(
              margin: EdgeInsets.only(left: 5),
              height: 140,
              width:110,
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(user.imageUrl),
                    radius: 40,
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(
                              0xFFC2D7F2,
                            ).withOpacity(0.5), // لون الظل
                            spreadRadius: 3, // مدى انتشار الظل
                            blurRadius: 7, // درجة ضبابية الظل
                            offset: Offset(3, 0), // اتجاه الظل (x, y)
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          Text(user.job, style: TextStyle(fontSize: 12)),
                          Rating(rate: user.rate)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
           
          }),
        ],
      ),
    );
  }
}
