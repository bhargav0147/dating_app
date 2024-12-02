// ignore_for_file: file_names

import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class IconButtonWithBackground extends StatelessWidget {
  final double height; // Required height of the container
  final double width; // Required width of the container
  final Color bgColor; // Required background color
  final IconData icon; // Required icon
  final double iconSize; // Required icon size
  final Color iconColor; // Required icon color
  final VoidCallback onClick; // Required onClick function

  const IconButtonWithBackground({
    super.key,
    required this.height,
    required this.width,
    required this.bgColor,
    required this.icon,
    required this.iconSize,
    required this.iconColor,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.shade100,
              blurRadius: 500,
              spreadRadius: 1,
              offset: const Offset(0, 20)
            ),

          ]
        ),
        child: Center(
          child: CustomIcon(
            icon: icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
