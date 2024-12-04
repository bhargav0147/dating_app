import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;
  final double borderRadius;

  const CustomCachedNetworkImage(
      {super.key,
      required this.height,
      required this.width,
      required this.imageUrl,
      required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
              color: AppColors.grey.shade300,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: AppColors.red,
          ),
        ),
      ),
    );
  }
}
