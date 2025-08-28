import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key ,required this.rate});
final double rate;
  @override
  Widget build(BuildContext context) {
    return Container(
                            padding: EdgeInsets.fromLTRB(2, 2, 5, 2),
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: const Color.fromARGB(255, 219, 217, 217),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 187, 69, 241),
                                  size: 20,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '$rate',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            )
                          );
  }
}