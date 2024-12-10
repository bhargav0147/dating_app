// ignore_for_file: file_names

import 'package:dating_app/app/modules/yourPreference/yourPreference_controller.dart';
import 'package:dating_app/app/validator/textfild_validator.dart';
import 'package:dating_app/app/widgets/customRangeSlider.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:dating_app/app/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/getLocationDetails.dart';
import '../../utils/navigation.dart';
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
                GestureDetector(
                  onTap: () async {
                    Map<String, String> locationDetails =
                        await getLocationDetails();

                    controller.city.value = locationDetails['city'].toString();
                    controller.state.value =
                        locationDetails['state'].toString();
                    controller.country.value =
                        locationDetails['country'].toString();
                  },
                  child: Container(
                    height: 58,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_rounded,
                            size: 20,
                            color: AppColors.primary,
                          ),
                          SizedBoxHelper.w10,
                          Obx(
                            () => Text(
                              controller.state.value.isEmpty
                                  ? 'Choose Your Location'
                                  : '${controller.city.value} ${controller.state.value} ${controller.country.value}',
                              style: AppFonts.medium
                                  .copyWith(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBoxHelper.h10,
                CustomTextField(
                  hintText: 'Bio',
                  maxLine: 5,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return Validators.bioValidator(value);
                  },
                ),
                SizedBoxHelper.h10,
                CustomButton(
                    label: 'Sumbit',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        NavigationUtils.navigateTo(AppRoutes.contacts);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
