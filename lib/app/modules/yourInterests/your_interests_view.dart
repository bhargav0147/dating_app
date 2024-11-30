import 'package:dating_app/app/modules/yourInterests/interest_card.dart';
import 'package:dating_app/app/modules/yourInterests/your_interests_controller.dart';
import 'package:dating_app/app/routes/app_routes.dart';
import 'package:dating_app/app/utils/navigation.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/sized_box_helper.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text.dart';

class YourInterestsView extends StatelessWidget {
  const YourInterestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final YourInterestsController controller =
        Get.put(YourInterestsController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(
            top: AppVariables.APPTOPSPACING,
            bottom: AppVariables.APPBOTTOMSPACING,
            left: AppVariables.APPSIDESPACING,
            right: AppVariables.APPSIDESPACING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBackButton(),
            SizedBoxHelper.h35,
            const CustomText(
              text: 'Your interests',
              style: AppFonts.veryExtraLarge,
              color: AppColors.black,
            ),
            CustomText(
              text:
                  'Select a minimum 5 interests and let everyone know what you’re passionate about.',
              style: AppFonts.extraSmall,
              color: AppColors.grey.shade900,
            ),
            SizedBoxHelper.h20,
            Expanded(
              child: GridView.builder(
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
    );
  }
}
