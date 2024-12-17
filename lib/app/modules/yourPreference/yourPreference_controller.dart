// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';
import '../../routes/app_routes.dart';
import '../../service/api/api_calling.dart';
import '../../service/api/api_constants.dart';
import '../../utils/navigation.dart';
import '../../utils/snackbars.dart';

class YourpreferenceController extends GetxController {
  RxBool isButtonLoading = false.obs;
  RxList<String> genderList = ['Male', 'Female', 'Transgender', 'Bisexual'].obs;
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

  String getSelectedInterests(List<int> selectedIndices) {

    final selectedInterests = selectedIndices
        .map((index) => interests[index]['text'] as String)
        .toList();


    return selectedInterests.join(', ');
  }

  void selectOption(int index) {
    selectedIndex.value = index;
  }

  void changeAgeValue (RangeValues value){
    ageRangeValue.value = value;
  }

  Future<void> addPref(BuildContext context) async {
    isButtonLoading.value = true;
    String? token = await AppVariables.getUserToken();

    if (token == null) {
      NavigationUtils.offAllTo(AppRoutes.onboarding);
      SnackbarUtils.showError(context, 'Session expired. Please log in again.');
      isButtonLoading.value = false;
      return;
    }

    Map<String,dynamic> body = {
      'genderPrefrences': genderList[selectedIndex.value],
      'minAge': ageRangeValue.value.start.toString(),
      'maxAge': ageRangeValue.value.end.toString(),
      'interests': getSelectedInterests(selectedIndices)
    };
    print(body);
    final response = await ApiService().postWithToken(ApiConstants.addPref, body,token);
    print(response);
    if (response['statusCode'] == 200) {
      SnackbarUtils.showSuccess(context,'${response['data']['message']}');
    } else {
      SnackbarUtils.showError(context,'${response['data']['message']}');
    }
    isButtonLoading.value = false;
  }
}
