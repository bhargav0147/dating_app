// ignore_for_file: file_names

import 'package:dating_app/app/modules/signup/signup_controller.dart';
import 'package:get/get.dart';

class MymobileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
