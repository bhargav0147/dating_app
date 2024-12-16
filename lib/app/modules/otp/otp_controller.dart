import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../service/api/api_calling.dart';
import '../../service/api/api_constants.dart';
import '../../utils/navigation.dart';
import '../../utils/snackbars.dart';

class OtpController extends GetxController {
  RxBool isButtonLoading = false.obs;

  Future<void> userRegister(
      {required Map<String, dynamic> body,
        required BuildContext context}) async {

    isButtonLoading.value = true;
    final response =
    await ApiService().postWithoutToken(ApiConstants.register, body);
    print(response);
    if (response['statusCode'] == 201) {


      // NavigationUtils.navigateTo(AppRoutes.dashbaord);
      SnackbarUtils.showSuccess(context, '${response['data']['message']}');
    } else {
      SnackbarUtils.showError(context, '${response['data']['message']}');
    }
    isButtonLoading.value = false;
  }
}