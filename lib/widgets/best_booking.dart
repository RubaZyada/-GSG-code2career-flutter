import 'package:flutter/material.dart';
import 'package:gsg_flutter/widgets/rating.dart';

// ignore: must_be_immutable
class BestBooking extends StatelessWidget {
  BestBooking({super.key});
List<String> images = [
  "assets/images/bestbooking1.png",
  "assets/images/bestbooking2.png",
];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: images.length,
    itemBuilder: (context, index) {
      return Container(
    margin: EdgeInsets.only(top: 10),
   
    height: 260,
    child: Column(
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(images[index]),),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Image.asset("assets/images/models/Ellipse 1097.png"),
                  ),
                  SizedBox(width: 15),
                  Container(
                    width: 200,
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Miss Zachary Will",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: "  Beautician",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xFF827BEB),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Occaecati aut nam beatae quo non deserunt consequatur.",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Rating(rate: 4.9)
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
    },
  );
  }}