// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../service/api/api_calling.dart';
import '../../service/api/api_constants.dart';
import '../../utils/navigation.dart';
import '../../utils/snackbars.dart';

class SignupController extends GetxController {
  RxBool isButtonLoading = false.obs;
  var data = {}.obs;

  Future<void> signUp(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber,
      required BuildContext context}) async {
    isButtonLoading.value = true;
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'username': userName,
    };
    final response =
        await ApiService().postWithoutToken(ApiConstants.signUp, body);
    if (response['statusCode'] == 201) {
      data.value = response['data'];
      NavigationUtils.navigateTo(AppRoutes.otp);
      SnackbarUtils.showSuccess(context, '${response['data']['message']}');
    } else {
      NavigationUtils.navigateTo(AppRoutes.otp);
      SnackbarUtils.showError(context, '${response['data']['message']}');
    }
    isButtonLoading.value = false;
  }
}
