import 'package:dating_app/app/modules/multiple_Images/multiple_images_controller.dart';
import 'package:get/get.dart';

class MultipleImagesBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MultipleImagesController>(() => MultipleImagesController(),);
  }
}