import 'package:dating_app/app/widgets/customCachedNetworkImage.dart';
import 'package:flutter/material.dart';

import '../../utils/sized_box_helper.dart';

class CardSwiperCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int age;
  final String city;
  final double km;

  const CardSwiperCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.age,
    required this.city,
    required this.km,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Hero(
            tag: 'friendProfileImage',
            child: CustomCachedNetworkImage(
                height: double.maxFinite,
                width: double.maxFinite,
                imageUrl: imageUrl,
                borderRadius: 50),
          ),
        ),
        // Gradient and text overlay
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(50)),
              gradient: LinearGradient(
                colors: [
                  Colors.pink, // Replace with your AppColors.primary
                  Colors.pink.withOpacity(0.6),
                  Colors.pink.withOpacity(0.5),
                  Colors.pink.withOpacity(0.4),
                  Colors.pink.withOpacity(0.25),
                  Colors.pink.withOpacity(0.1),
                  Colors.pink.withOpacity(0.05),
                  Colors.pink.withOpacity(0.01),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$name, $age",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBoxHelper.h5,
                  Text(
                    "Live in $city",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.7),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.location_on_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBoxHelper.w5,
                  Text(
                    '$km KM',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
