// ignore_for_file: file_names

import 'package:dating_app/app/modules/signup/signup_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../service/api/api_calling.dart';
import '../../service/api/api_constants.dart';
import '../../utils/navigation.dart';
import '../../utils/snackbars.dart';

class SignupController extends GetxController {
  RxBool isButtonLoading = false.obs;
  RxString mobileNumber = ''.obs;
  RxString countryCode = ''.obs;
  var data = {}.obs;

  Future<void> sendOtp(
      {required String email,
      required String userName,
        required String password,
      required BuildContext context}) async {

    isButtonLoading.value = true;
    Map<String, dynamic> body = {
      'email': email,
      'mobile': mobileNumber.value,
      'countryCode': countryCode.value,
      'isForgot':false.toString(),
      'username': userName,
    };
    print(body);
    final response =
        await ApiService().postWithoutToken(ApiConstants.sendOtp, body);
    if (response['statusCode'] == 200) {
      data.value = response['data'];
      final SignUpFormModel signUpFormModel = SignUpFormModel(
        email: email,
        mobile: mobileNumber.value,
        countryCode: countryCode.value,
        username: userName,
        password: password,
      );
      NavigationUtils.navigateTo(AppRoutes.otp,arguments: signUpFormModel);
      SnackbarUtils.showSuccess(context, '${response['data']['message']}');
    } else {
      SnackbarUtils.showError(context, '${response['data']['message']}');
    }
    isButtonLoading.value = false;
  }
}
