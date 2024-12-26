// ignore_for_file: file_names

import 'package:get/get.dart';

class EditProfileController extends GetxController {
  RxString selectedBirthDate = ''.obs;

  RxString city = ''.obs;
  RxString state = ''.obs;
  RxString country = ''.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

}
