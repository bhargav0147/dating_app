// ignore_for_file: file_names

import 'package:dating_app/app/modules/yourPreference/yourPreference_controller.dart';
import 'package:dating_app/app/widgets/customRangeSlider.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/navigation.dart';
import '../../utils/sized_box_helper.dart';
import '../../widgets/back_button.dart';
import '../../widgets/customToggleButton.dart';
import '../../widgets/custom_text.dart';
import 'interest_card.dart';

class YourpreferenceView extends StatelessWidget {
  const YourpreferenceView({super.key});

  @override
  Widget build(BuildContext context) {
    final YourpreferenceController controller =
        Get.put(YourpreferenceController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: AppVariables.APPBOTTOMSPACING,
              left: AppVariables.APPSIDESPACING,
              right: AppVariables.APPSIDESPACING,
              top: AppVariables.APPTOPSPACING),
          child: SingleChildScrollView(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Age',
                      style: AppFonts.mediumBold,
                      color: AppColors.grey.shade900,
                    ),
                    Obx(
                      () => CustomText(
                        text:
                            '${controller.ageRangeValue.value.start.toInt()} - ${controller.ageRangeValue.value.end.toInt()}',
                        style: AppFonts.mediumBold,
                        color: AppColors.grey.shade900,
                      ),
                    ),
                  ],
                ),
                Obx(() => CustomRangeSlider(
                    min: controller.minAge.value,
                    max: controller.maxAge.value,
                    divisions: 90,
                    values: controller.ageRangeValue.value,
                    onChanged: controller.changeAgeValue)),
                SizedBoxHelper.h10,
                CustomText(
                  text:
                  'Select a minimum 5 interests and let everyone know what you’re passionate about.',
                  style: AppFonts.extraSmall,
                  color: AppColors.grey.shade900,
                ),
                SizedBoxHelper.h10,
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3.5),
                  itemCount: controller.interests.length,
                  itemBuilder: (context, index) {
                    final interest = controller.interests[index];
                    return Obx(
                          () => InterestCard(
                        icon: interest['icon'],
                        text: interest['text'],
                        isSelected: controller.selectedIndices.contains(index),
                        onTap: () => controller.toggleInterest(index),
                      ),
                    );
                  },
                ),
                SizedBoxHelper.h10,
                Obx(
                      () => Visibility(
                    visible: controller.selectedIndices.length >= 5,
                    child: CustomButton(
                      label: 'Submit',
                      onPressed: () {
                        NavigationUtils.navigateTo(AppRoutes.yourPreference);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
