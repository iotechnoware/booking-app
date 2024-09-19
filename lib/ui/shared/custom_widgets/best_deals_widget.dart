import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gofly/selectflightfilterandshort.dart';
import 'package:gofly/ui/shared/colors.dart';

class BestDealsWidget extends StatelessWidget {
  const BestDealsWidget({Key? key, required this.name, required this.imageUrl, required this.location, required this.price}) : super(key: key);

  final String name;
  final String imageUrl;
  final String location;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.greenAccent[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 302,
        width: 275,
        decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => bestDeals(),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 10, left: 8, right: 8),
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      //color: Colors.black,
                      borderRadius:
                      BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(12),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 35,
                    width: 35,
                    margin: const EdgeInsets.only(
                        top: 18, right: 16),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(100),
                      color: Colors.white.withOpacity(0.5),
                      image: const DecorationImage(
                        image:
                        AssetImage("assets/old_images/Heart.png",),
                        scale: 32,
                      ),
                    ),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 15, sigmaY: 15),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: 'Gilroy'),
                      ),
                      const Text(
                        "From",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontFamily: 'Gilroy'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                              "assets/old_images/Locationexplore.png",
                              scale: 28),
                          Text(
                            location,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                fontFamily: 'Gilroy'),
                          ),
                        ],
                      ),
                      Row(
                        children:  [
                          Text(
                            "\$$price",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: 'Gilroy'),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
