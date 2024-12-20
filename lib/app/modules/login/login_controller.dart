import 'package:dating_app/app/modules/splash/splash_controller.dart';
import 'package:dating_app/app/service/api/api_calling.dart';
import 'package:dating_app/app/service/api/api_constants.dart';
import 'package:dating_app/app/utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';

class LoginController extends GetxController {
  var data = {}.obs;
  RxBool isLoading = false.obs;

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    isLoading.value = true;
    Map<String, dynamic> body = {'email': email, 'password': password};
    final response =
        await ApiService().postWithoutToken(ApiConstants.login, body);
    if (response['statusCode'] == 200) {
      data.value = response['data'];
      await AppVariables.saveUserToken(response['data']['token']);
      try {
        final SplashController splashController = Get.put(SplashController());
        await splashController.fetchUserProfile(
            token: response['data']['token']);
        SnackbarUtils.showSuccess(context, '${response['data']['message']}');
      } catch (e) {
        SnackbarUtils.showError(context, 'Failed to fetch user profile.');
      }
    } else {
      SnackbarUtils.showError(context, '${response['data']['message']}');
    }
    isLoading.value = false;
  }
}
