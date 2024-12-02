import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/app/routes/app_routes.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/utils/navigation.dart';
import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../config/app_variables.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: AppVariables.APPTOPSPACING,
            bottom: AppVariables.APPBOTTOMSPACING,
            left: AppVariables.APPSIDESPACING,
            right: AppVariables.APPSIDESPACING),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                    text: 'bkhush_312',
                    style: AppFonts.extraLarge,
                    color: AppColors.black,
                  ),
                  Spacer(),
                  CustomIcon(
                    icon: Icons.add_circle,
                    size: 25,
                    color: AppColors.black,
                  ),
                  SizedBoxHelper.w15,
                  GestureDetector(
                    onTap: () {
                      NavigationUtils.navigateTo(AppRoutes.settings);
                    },
                    child: CustomIcon(
                      icon: Icons.menu,
                      size: 25,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBoxHelper.w15,
                ],
              ),
              SizedBoxHelper.h15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  SizedBoxHelper.w15,
                  Column(
                    children: [
                      CustomText(
                        text: '15',
                        style: AppFonts.mediumBold,
                        color: AppColors.black,
                      ),
                      SizedBoxHelper.h5,
                      CustomText(
                        text: 'posts',
                        style: AppFonts.mediumBold,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomText(
                        text: '652',
                        style: AppFonts.mediumBold,
                        color: AppColors.black,
                      ),
                      SizedBoxHelper.h5,
                      CustomText(
                        text: 'followers',
                        style: AppFonts.mediumBold,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomText(
                        text: '50',
                        style: AppFonts.mediumBold,
                        color: AppColors.black,
                      ),
                      SizedBoxHelper.h5,
                      CustomText(
                        text: 'following',
                        style: AppFonts.mediumBold,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
