import 'dart:io';
import 'dart:typed_data';
import 'package:dating_app/app/service/api/api_calling.dart';
import 'package:dating_app/app/service/api/api_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/app_variables.dart';
import '../../routes/app_routes.dart';
import '../../utils/navigation.dart';
import '../../utils/snackbars.dart';

class MultipleImagesController extends GetxController {
  RxBool isButtonLoading = false.obs;
  Rx<dynamic> selectedProfileImage = Rx<dynamic>(null);
  Rx<dynamic> imageOne = Rx<dynamic>(null);
  Rx<dynamic> imageTwo = Rx<dynamic>(null);
  Rx<dynamic> imageThree = Rx<dynamic>(null);
  Rx<dynamic> imageFour = Rx<dynamic>(null);
  Rx<dynamic> imageFive = Rx<dynamic>(null);

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(Rx<dynamic> imageVariable) async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      if (kIsWeb) {
        final Uint8List bytes = await image.readAsBytes();
        imageVariable.value = bytes;
      } else {
        final File file = File(image.path);
        imageVariable.value = file;
      }
    }
  }

  bool validateImages() {
    if (selectedProfileImage.value == null) {
      return false;
    }

    List<Rx<dynamic>> otherImages = [
      imageOne,
      imageTwo,
      imageThree,
      imageFour,
      imageFive,
    ];

    int filledImagesCount =
        otherImages.where((image) => image.value != null).length;

    return filledImagesCount >= 3;
  }

  List<dynamic> getSelectedImages() {
    List<Rx<dynamic>> otherImages = [
      imageOne,
      imageTwo,
      imageThree,
      imageFour,
      imageFive,
    ];

    return otherImages
        .where((image) => image.value != null)
        .map((image) => image.value)
        .toList();
  }

  Future<void> createUserProfile(
      {required BuildContext context,
      required Map<String, dynamic> data}) async {
    isButtonLoading.value = true;
    String? token = await AppVariables.getUserToken();

    if (token == null) {
      NavigationUtils.offAllTo(AppRoutes.onboarding);
      SnackbarUtils.showError(context, 'Session expired. Please log in again.');
      isButtonLoading.value = false;
      return;
    }

    final response = await ApiService().postMultiPartWithToken(
        endpoint: ApiConstants.getUserProfile,
        data: data,
        mainImage: selectedProfileImage,
        profilePictures: getSelectedImages(),
        token: token);

    if (response['statusCode'] == 201) {
      SnackbarUtils.showSuccess(context,'${response['data']['message']}');
    } else {
      SnackbarUtils.showError(context,'${response['data']['message']}');
    }
    isButtonLoading.value = false;
  }
}
