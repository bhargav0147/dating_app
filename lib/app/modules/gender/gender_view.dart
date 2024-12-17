import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/navigation.dart';
import '../../utils/sized_box_helper.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import 'gender_controller.dart';
import 'gender_option_widget.dart';

class GenderView extends StatelessWidget {
  const GenderView({super.key});

  @override
  Widget build(BuildContext context) {
    final GenderController controller = Get.put(GenderController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
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
              text: 'I am a',
              style: AppFonts.veryExtraLarge,
              color: AppColors.black,
            ),
            SizedBoxHelper.h35,
            GenderOption(
              gender: 'Woman',
              selectedGender: controller.selectedGemder,
              controller: controller,
            ),
            SizedBoxHelper.h15,
            GenderOption(
              gender: 'Man',
              selectedGender: controller.selectedGemder,
              controller: controller,
            ),
            SizedBoxHelper.h15,
            GenderOption(
              gender: 'Other',
              selectedGender: controller.selectedGemder,
              controller: controller,
            ),
            SizedBoxHelper.h15,
            Obx(
              () => Visibility(
                visible: controller.selectedGemder.value.isEmpty ? false : true,
                child: CustomButton(
                  label: 'Continue',
                  onPressed: () {
                    NavigationUtils.replaceWith(AppRoutes.yourPreference);
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
