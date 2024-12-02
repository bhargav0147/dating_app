import 'package:dating_app/app/modules/show_post/show_post_controller.dart';
import 'package:get/get.dart';

class ShowPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowPostController>(() => ShowPostController());
  }
}
