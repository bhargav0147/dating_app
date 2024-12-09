import 'package:dating_app/app/modules/reels/reels_controller.dart';
import 'package:get/get.dart';

class ReelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReelsController>(() => ReelsController(),);
  }
}