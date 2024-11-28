import 'package:dating_app/app/assets/image_config.dart';
import 'package:flutter/material.dart';

import '../../config/app_variables.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/navigation.dart';
import '../../utils/sized_box_helper.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon.dart';
import '../../widgets/custom_text.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              top: AppVariables.APPTOPSPACING,
              bottom: AppVariables.APPBOTTOMSPACING,
              left: AppVariables.APPSIDESPACING,
              right: AppVariables.APPSIDESPACING),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                    alignment: Alignment.centerLeft, child: CustomBackButton()),
                SizedBoxHelper.h30,
                const CustomIcon(
                  icon: Icons.favorite,
                  color: AppColors.primary,
                  size: 100,
                ),
                SizedBoxHelper.h30,
                const CustomText(
                  text: 'Sign up to continue',
                  textAlign: TextAlign.center,
                  color: AppColors.black,
                  style: AppFonts.extraLarge,
                ),
                SizedBoxHelper.h30,
                CustomButton(
                  label: 'Continue with email',
                  onPressed: () {
                    NavigationUtils.navigateTo(AppRoutes.signup);
                  },
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.white,
                  isLoading: false,
                ),
                SizedBoxHelper.h30,
                GestureDetector(
                  onTap: () {
                    NavigationUtils.navigateTo(AppRoutes.myMobile);
                  },
                  child: const CustomText(text: 'Use phone number',style: AppFonts.mediumBold,color: AppColors.primary,)),
                SizedBoxHelper.h30,
                const CustomText(
                  text: 'or sign up with',
                  textAlign: TextAlign.center,
                  color: AppColors.black,
                  style: AppFonts.small,
                ),
                SizedBoxHelper.h30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.grey.shade200),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Image.asset(AppImages.facebook,
                            height: 24, width: 24),
                      ),
                    ),
                    Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.grey.shade200),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Image.asset(AppImages.google,
                            height: 24, width: 24),
                      ),
                    )
                  ],
                ),
                SizedBoxHelper.h30,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Terms of use',
                      style: AppFonts.extraSmall,
                      color: AppColors.primary,
                    ),
                    SizedBoxHelper.w50,
                    CustomText(
                      text: 'Privacy Policy',
                      style: AppFonts.extraSmall,
                      color: AppColors.primary,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
