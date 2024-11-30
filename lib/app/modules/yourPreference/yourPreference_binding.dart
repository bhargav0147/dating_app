// ignore_for_file: file_names

import 'package:dating_app/app/modules/yourPreference/yourPreference_controller.dart';
import 'package:get/get.dart';

class YourpreferenceBinsing extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<YourpreferenceController>(()=>YourpreferenceController());
  }
}