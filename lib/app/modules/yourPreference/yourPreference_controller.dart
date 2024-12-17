// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourpreferenceController extends GetxController {
  RxList<String> genderList = ['Man', 'Woman', 'Transgender', 'Bisexual'].obs;
  RxInt selectedIndex = 0.obs;
  Rx<RangeValues> ageRangeValue = const RangeValues(18, 60).obs;
  RxDouble minAge = 10.0.obs;
  RxDouble maxAge = 100.0.obs;

  final interests = [
    {'icon': Icons.camera, 'text': 'Photography'},
    {'icon': Icons.shopping_bag, 'text': 'Shopping'},
    {'icon': Icons.mic, 'text': 'Karaoke'},
    {'icon': Icons.movie, 'text': 'Movie'},
    {'icon': Icons.blender, 'text': 'Cooking'},
    {'icon': Icons.sports_baseball, 'text': 'Tennis'},
    {'icon': Icons.directions_run, 'text': 'Run'},
    {'icon': Icons.pool, 'text': 'Swimming'},
    {'icon': Icons.palette, 'text': 'Art'},
    {'icon': Icons.hiking, 'text': 'Traveling'},
    {'icon': Icons.paragliding, 'text': 'Extreme'},
    {'icon': Icons.music_note, 'text': 'Music'},
    {'icon': Icons.local_bar, 'text': 'Drink'},
    {'icon': Icons.sports_esports, 'text': 'Video games'},
  ].cast<Map<String, dynamic>>();

  RxList<int> selectedIndices = <int>[].obs;

  void toggleInterest(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      selectedIndices.add(index);
    }
  }

  void selectOption(int index) {
    selectedIndex.value = index;
  }

  void changeAgeValue (RangeValues value){
    ageRangeValue.value = value;
  }
}
