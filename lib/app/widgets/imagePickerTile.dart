import 'dart:io';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';

import 'custom_text.dart';

class ImagePickerTile extends StatelessWidget {
  final Rx<dynamic> image;
  final Function(Rx<dynamic>) onPickImage;
  final double height;

  const ImagePickerTile({
    super.key,
    required this.image,
    required this.onPickImage,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await onPickImage(image);
      },
      child: Obx(() {
        return DottedBorder(
          color: AppColors.primary, // Replace with AppColors.primary.shade300
          borderType: BorderType.RRect,
          radius: const Radius.circular(15),
          dashPattern: const [6, 3],
          child: Container(
            height: height,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white, // Replace with AppColors.white
              borderRadius: BorderRadius.circular(15),
              image: image.value != null
                  ? DecorationImage(
                image: kIsWeb
                    ? MemoryImage(image.value)
                    : FileImage(image.value as File) as ImageProvider,
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: image.value == null
                ?  const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle,
                  color: AppColors.primary, // Replace with AppColors.primary
                  size: 40,
                ),
                SizedBox(height: 10),
                CustomText(
                  text:'Add Image',
                  style: AppFonts.smallBold,
                  color: AppColors.grey,
                  textAlign: TextAlign.center,
                ),
              ],
            )
                : null,
          ),
        );
      }),
    );
  }
}

