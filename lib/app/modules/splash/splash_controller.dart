import 'dart:async';
import 'package:dating_app/app/service/api/api_constants.dart';
import 'package:get/get.dart';
import '../../config/app_variables.dart';
import '../../routes/app_routes.dart';
import '../../service/api/api_calling.dart';
import '../../utils/navigation.dart';
import 'user_profile_model.dart';

class SplashController extends GetxController {
  final ApiService apiService = ApiService();
  late UserProfileModel userProfile;
  @override
  void onInit() {
    super.onInit();
    navigateToNextPage();
  }

  Future<void> navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    bool isLoggedIn = await AppVariables.isLoggedIn();
    if (isLoggedIn) {
      String? token = await AppVariables.getUserToken();
      if (token == null) {
        NavigationUtils.offAllTo(AppRoutes.onboarding);
        return;
      } else {
        await fetchUserProfile(token);
      }
    } else {
      NavigationUtils.offAllTo(AppRoutes.onboarding);
    }
  }

  Future<void> fetchUserProfile(String token) async {

    final response =
        await apiService.getWithToken(ApiConstants.getUserProfile, token);

    if (response['statusCode'] == 200) {
      userProfile = UserProfileModel.fromJson(response['data']);
      decideNavigation();
    } else {
      NavigationUtils.offAllTo(AppRoutes.onboarding);
    }
  }

  void decideNavigation() {
    if (userProfile.userData?.isProfileCompleted == false) {
      NavigationUtils.offAllTo(AppRoutes.yourPreference);
    } else if (userProfile.userData?.isPrefrencesCompleted == false) {
      NavigationUtils.offAllTo(AppRoutes.editProfile);
    } else {
      NavigationUtils.offAllTo(AppRoutes.dashbaord);
    }
  }

}
