// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditprofileController extends GetxController {
  RxString selectedBirthDate = ''.obs;

  RxString city = ''.obs;
  RxString state = ''.obs;
  RxString country = ''.obs;

  // Use dynamic to handle both File and Uint8List
  Rx<dynamic> selectedImage = Rx<dynamic>(null);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    if (kIsWeb) {
      // Web-specific image picking
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        final Uint8List bytes = await image.readAsBytes(); // Read image as bytes
        selectedImage.value = bytes; // Store Uint8List
      }
    } else {
      // Mobile or desktop
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        final File file = File(image.path);
        selectedImage.value = file; // Store File
      }
    }
  }
}
