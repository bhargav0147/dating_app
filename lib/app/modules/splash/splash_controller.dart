import 'dart:async';

import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/navigation.dart';

class SplashController extends GetxController 
{
  @override
  void onInit() {
    super.onInit();
    navigateToLogin();
  }

  void navigateToLogin() {
    Timer(const Duration(seconds: 2), () {
      NavigationUtils.replaceWith(AppRoutes.login); 
    });
  }
}