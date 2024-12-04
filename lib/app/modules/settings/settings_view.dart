import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:dating_app/app/widgets/back_button.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../config/app_variables.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../widgets/custom_text.dart';
import 'settings_menu_card.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              top: AppVariables.APPTOPSPACING,
              bottom: AppVariables.APPBOTTOMSPACING,
              left: AppVariables.APPSIDESPACING,
              right: AppVariables.APPSIDESPACING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomBackButton()),
              SizedBoxHelper.h10,
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Settings',
                  style: AppFonts.veryExtraLarge,
                  color: AppColors.black,
                ),
              ),
              SizedBoxHelper.h25,
              const SettingsMenuCard(
                icon: Icons.person,
                text: 'Personal Details',
              ),
              Divider(
                color: AppColors.grey.shade200,
                thickness: 0.5,
              ),
              SizedBoxHelper.h15,
              const SettingsMenuCard(
                icon: Icons.settings,
                text: 'Settings',
              ),
              Divider(
                color: AppColors.grey.shade200,
                thickness: 0.5,
              ),
              SizedBoxHelper.h15,
              const SettingsMenuCard(
                icon: Icons.language,
                text: 'Tearms & Conditions',
              ),
              Divider(
                color: AppColors.grey.shade200,
                thickness: 0.5,
              ),
              SizedBoxHelper.h15,
              const SettingsMenuCard(
                icon: Icons.notifications,
                text: 'Privacy Policy',
              ),
              Divider(
                color: AppColors.grey.shade200,
                thickness: 0.5,
              ),
              SizedBoxHelper.h15,
              const SettingsMenuCard(
                icon: Icons.visibility,
                text: 'About Us',
              ),
              Divider(
                color: AppColors.grey.shade200,
                thickness: 0.5,
              ),
              SizedBoxHelper.h25,
              CustomButton(
                label: 'Logout',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
