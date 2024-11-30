// ignore_for_file: file_names

import 'package:dating_app/app/modules/yourPreference/yourPreference_controller.dart';
import 'package:dating_app/app/widgets/customRangeSlider.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/getLocationDetails.dart';
import '../../utils/sized_box_helper.dart';
import '../../widgets/back_button.dart';
import '../../widgets/customToggleButton.dart';
import '../../widgets/custom_text.dart';

class YourpreferenceView extends StatelessWidget {
  const YourpreferenceView({super.key});

  @override
  Widget build(BuildContext context) {
    final YourpreferenceController controller =
        Get.put(YourpreferenceController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: AppVariables.APPBOTTOMSPACING,
            left: AppVariables.APPSIDESPACING,
            right: AppVariables.APPSIDESPACING,
            top: AppVariables.APPTOPSPACING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBackButton(),
            SizedBoxHelper.h35,
            const CustomText(
              text: 'Your Preference',
              style: AppFonts.veryExtraLarge,
              color: AppColors.black,
            ),
            SizedBoxHelper.h10,
            CustomText(
              text: 'Interested in',
              style: AppFonts.mediumBold,
              color: AppColors.grey.shade900,
            ),
            SizedBoxHelper.h10,
            Obx(
              () => CustomToggleButtons(
                items: controller.genderList,
                selectedIndex: controller.selectedIndex.value,
                onChanged: (int index) {
                  controller.selectOption(index);
                },
              ),
            ),
            SizedBoxHelper.h10,
            CustomText(
              text: 'Age',
              style: AppFonts.mediumBold,
              color: AppColors.grey.shade900,
            ),
            Obx(() => CustomRangeSlider(
                min: controller.minAge.value,
                max: controller.maxAge.value,
                divisions: 90,
                values: controller.ageRangeValue.value,
                onChanged: controller.changeAgeValue)),
            SizedBoxHelper.h10,
            CustomButton(
                label: 'Sumbit',
                onPressed: () async {
                  Map<String, String> locationDetails =
                      await getLocationDetails();
                  print("Latitude: ${locationDetails['latitude']}");
                  print("Longitude: ${locationDetails['longitude']}");
                  print("City: ${locationDetails['city']}");
                  print("State: ${locationDetails['state']}");
                  print("Country: ${locationDetails['country']}");
                })
          ],
        ),
      ),
    );
  }
}
