import 'package:dating_app/app/modules/gender/gender_controller.dart';
import 'package:get/get.dart';

class GenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenderController>(() => GenderController());
  }
}
