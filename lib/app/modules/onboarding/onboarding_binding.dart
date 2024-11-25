import 'package:dating_app/app/modules/onboarding/onboarding_controller.dart';
import 'package:get/get.dart';
class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
