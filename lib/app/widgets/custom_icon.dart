import 'package:dating_app/app/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  const CustomIcon({
    super.key,
    required this.icon,
    this.size = 24.0,
    this.color = AppColors.white,
    this.onPressed,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onPressed,
        child: Icon(
          icon,
          size: size,
          color: color,
        ),
      ),
    );
  }
}
