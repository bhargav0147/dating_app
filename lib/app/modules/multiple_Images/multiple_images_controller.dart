import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/snackbars.dart';

class MultipleImagesController extends GetxController {
  // Define variables for three images
  Rx<dynamic> selectedProfileImage = Rx<dynamic>(null);
  Rx<dynamic> imageOne = Rx<dynamic>(null);
  Rx<dynamic> imageTwo = Rx<dynamic>(null);
  Rx<dynamic> imageThree = Rx<dynamic>(null);
  Rx<dynamic> imageFour = Rx<dynamic>(null);
  Rx<dynamic> imageFive = Rx<dynamic>(null);

  final ImagePicker picker = ImagePicker();


  Future<void> pickImage(Rx<dynamic> imageVariable) async {
    if (kIsWeb) {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        final Uint8List bytes = await image.readAsBytes();
        imageVariable.value = bytes;
      }
    } else {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        final File file = File(image.path);
        imageVariable.value = file;
      }
    }
  }

  bool validateImages(BuildContext context) {
    if (selectedProfileImage.value == null) {
      SnackbarUtils.showError(context, 'Profile image is required');
      return false;
    }


    List<Rx<dynamic>> otherImages = [
      imageOne,
      imageTwo,
      imageThree,
      imageFour,
      imageFive
    ];

    int filledImagesCount =
        otherImages.where((image) => image.value != null).length;

    if (filledImagesCount < 3) {
      SnackbarUtils.showError(context, 'At least three additional images are required');
      return false;
    }

    return true;
  }


  List<dynamic> getSelectedImages() {
    List<Rx<dynamic>> otherImages = [
      imageOne,
      imageTwo,
      imageThree,
      imageFour,
      imageFive
    ];


    return otherImages
        .where((image) => image.value != null)
        .map((image) => image.value)
        .toList();
  }


  Future<List<dynamic>?> handleImageSelection(BuildContext context) async {
    if (validateImages(context)) {
      return getSelectedImages();
    }
    return null;
  }
}
