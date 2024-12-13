import 'package:flutter/material.dart';

import '../../config/app_variables.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/navigation.dart';
import '../../utils/sized_box_helper.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class MultipleImagesView extends StatelessWidget {
  const MultipleImagesView({super.key});

  @override
  Widget build(BuildContext context) {
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
                text: 'Add photos',
                style: AppFonts.veryExtraLarge,
                color: AppColors.black,
              ),
              SizedBoxHelper.h15,
              const CustomText(
                text: 'Add at least 2 photos to continue',
                style: AppFonts.mediumBold,
                color: AppColors.grey,
              ),
              SizedBoxHelper.h35,
              CustomButton(
                label: 'Continue',
                onPressed: () {
                  NavigationUtils.navigateTo(AppRoutes.gender);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
