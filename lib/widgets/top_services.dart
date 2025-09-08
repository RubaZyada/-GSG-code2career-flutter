import 'package:flutter/material.dart';
import 'package:gsg_flutter/widgets/rating.dart';
import 'package:gsg_flutter/data/service_model.dart';

class TopServices extends StatelessWidget {
  TopServices({super.key});

  final List<ServiceModel> topServices = [
    ServiceModel(serviceImage: "assets/images/topServices1.png"),
    ServiceModel(serviceImage: "assets/images/topServices2.png"),
    ServiceModel(serviceImage: "assets/images/topServices3.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(topServices.length, (index) {
          final service = topServices[index];
          return SizedBox(
            height: 170,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // لازم تحدد مكانها
                Positioned(
                  left: 6,
                  top: 0,
                  child: Container(
                    width: 197,
                    height: 154,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(service.serviceImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  right: 15,
                  bottom: 33,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    width: 290,
                    height: 123,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/models/Ellipse 1097.png",
                          ),
                          radius: 30,
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 200,
                          height: 125,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Miss Zachary Will",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Beautician",
                                style: TextStyle(color: Color(0xFF827BEB)),
                              ),
                              const Text(
                                "Doloribus saepe aut necessit qui non qui.",
                                style: TextStyle(
                                  color: Color(0xFF6B6B6B),
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Rating(rate: 3.5),
                                  const SizedBox(width: 12),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          const Color(0xFF827BEB),
                                      minimumSize: const Size(120, 40),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "Book Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
