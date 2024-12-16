import 'package:dating_app/app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';
import '../../routes/app_routes.dart';
import '../../service/api/api_calling.dart';
import '../../service/api/api_constants.dart';
import '../../utils/snackbars.dart';

class ChangePasswordController extends GetxController{
  RxBool isButtonLoading = false.obs;

  Future<void> changePassword({required String oldPassword, required String newPassword,required BuildContext context})async {
    isButtonLoading.value = true;
    String? token = await AppVariables.getUserToken();

    if (token == null) {
      SnackbarUtils.showError(context, 'Session expired. Please log in again.');
      NavigationUtils.offAllTo(AppRoutes.onboarding);
      isButtonLoading.value = false;
      return;
    }

    Map<String,dynamic> body = {
      'currentPassword':oldPassword,
      'newPassword':newPassword
    };
    final response = await ApiService().postWithToken(ApiConstants.changePassword, body,token);

    if (response['statusCode'] == 200) {
      SnackbarUtils.showSuccess(context,'${response['data']['message']}');
    } else {
      SnackbarUtils.showError(context,'${response['data']['message']}');
    }
    isButtonLoading.value = false;
  }
}