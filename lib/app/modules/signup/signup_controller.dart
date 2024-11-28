import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/snackbars.dart';

class SignupController extends GetxController {
  /// Gender options for the dropdown
  final List<String> genderOptions = [
    'Male',
    'Female',
    'Transgender'
  ];

  RxString selectedGender = ''.obs;

  RxString selectedBirthDate = ''.obs;
 
  void handleSignup(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      SnackbarUtils.showSuccess('Sign Up Successful');
    } else {
      SnackbarUtils.showError('Please fill out the form correctly');
    }
  }
}
