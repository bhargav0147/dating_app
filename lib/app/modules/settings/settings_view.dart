import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/app/utils/sized_box_helper.dart';
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
              Align(
                alignment: Alignment.centerLeft,
                child: const CustomText(
                  text: 'Settings',
                  style: AppFonts.veryExtraLarge,
                  color: AppColors.black,
                ),
              ),
              SizedBoxHelper.h10,
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.pexels.com/photos/1391499/pexels-photo-1391499.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: AppColors.red),
                ),
              ),
              SizedBoxHelper.h10,
              const CustomText(
                text: 'Bhargav Kalariya',
                style: AppFonts.mediumBold,
                color: AppColors.black,
              ),
              SizedBoxHelper.h5,
              const CustomText(
                text: 'bhargavpatel6832@gmail.com',
                style: AppFonts.mediumBold,
                color: AppColors.grey,
              ),
              SizedBoxHelper.h15,
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
