import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImagesController extends GetxController {
  // Define variables for three images
  Rx<dynamic> selectedProfileImage = Rx<dynamic>(null);
  Rx<dynamic> firstImage = Rx<dynamic>(null);
  Rx<dynamic> secondImage = Rx<dynamic>(null);

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(Rx<dynamic> imageVariable) async {
    if (kIsWeb) {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        final Uint8List bytes = await image.readAsBytes(); // Read image as bytes
        imageVariable.value = bytes; // Store Uint8List
      }
    } else {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        final File file = File(image.path);
        imageVariable.value = file; // Store File
      }
    }
  }
}
