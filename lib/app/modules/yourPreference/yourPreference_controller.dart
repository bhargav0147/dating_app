// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourpreferenceController extends GetxController {
  RxList<String> genderList = ['Man', 'Woman', 'Transgender'].obs;
  RxInt selectedIndex = 0.obs;
  Rx<RangeValues> ageRangeValue = const RangeValues(18, 60).obs;
  RxDouble minAge = 10.0.obs;
  RxDouble maxAge = 100.0.obs;

  RxString city = ''.obs;
  RxString state = ''.obs;
  RxString country = ''.obs;

  void selectOption(int index) {
    selectedIndex.value = index;
  }

  void changeAgeValue (RangeValues value){
    ageRangeValue.value = value;
  }
}
