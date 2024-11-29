import 'package:dating_app/app/modules/yourInterests/your_interests_controller.dart';
import 'package:get/get.dart';

class YourInterestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourInterestsController>(() => YourInterestsController());
  }
}
