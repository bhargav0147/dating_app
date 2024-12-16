import 'dart:async';
import 'package:get/get.dart';
import '../../config/app_variables.dart';
import '../../routes/app_routes.dart';
import '../../utils/navigation.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToNextPage();
  }

  Future<void> navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    bool isLoggedIn = await AppVariables.isLoggedIn();
    if (isLoggedIn) {
      NavigationUtils.offAllTo(AppRoutes.dashbaord);
    } else {
      NavigationUtils.offAllTo(AppRoutes.onboarding);
    }
  }
}
