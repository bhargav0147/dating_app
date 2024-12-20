// ignore_for_file: file_names

import 'package:dating_app/app/modules/editProfile/editProfile_controller.dart';
import 'package:get/get.dart';

class EditprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(()=>EditProfileController());
  }
}