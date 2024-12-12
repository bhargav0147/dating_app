import 'package:dating_app/app/config/app_variables.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:dating_app/app/widgets/back_button.dart';
import 'package:dating_app/app/widgets/customCachedNetworkImage.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/snackbars.dart';
import '../../widgets/iconButtonWithBackground.dart';

class FriendProfileView extends StatelessWidget {
  const FriendProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final String imageUrl = Get.arguments ?? '';
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: [
                  CustomCachedNetworkImage(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      imageUrl: imageUrl,
                      borderRadius: 0),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: AppVariables.APPTOPSPACING),
                    child: CustomBackButton(),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6 + 50,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppVariables.APPSIDESPACING),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 100,
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButtonWithBackground(
                                height: 80,
                                width: 80,
                                bgColor: AppColors.white,
                                icon: Icons.close,
                                iconColor: AppColors.yellow,
                                iconSize: 30,
                                onClick: () {
                                  SnackbarUtils.showSuccess(
                                      context, 'You Press Close Button');
                                },
                              ),
                              IconButtonWithBackground(
                                height: 100,
                                width: 100,
                                bgColor: AppColors.white,
                                icon: Icons.favorite,
                                iconColor: AppColors.primary,
                                iconSize: 40,
                                onClick: () {
                                  SnackbarUtils.showSuccess(
                                      context, 'You Press Like Button');
                                },
                              ),
                              IconButtonWithBackground(
                                height: 80,
                                width: 80,
                                bgColor: AppColors.white,
                                icon: Icons.star,
                                iconColor: AppColors.purple,
                                iconSize: 30,
                                onClick: () {
                                  SnackbarUtils.showSuccess(
                                      context, 'You Press Star Button');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBoxHelper.h30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Jessica Parker, 23',
                                style: AppFonts.largeBold,
                                color: AppColors.black,
                              ),
                              SizedBoxHelper.h5,
                              CustomText(
                                text: 'Proffesional model',
                                style: AppFonts.medium,
                                color: AppColors.grey,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.black.shade100
                                        .withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(
                                child: Icon(
                                  Icons.send,
                                  color: AppColors.primary,
                                  size: 25,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBoxHelper.h30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Location',
                                style: AppFonts.largeBold,
                                color: AppColors.black,
                              ),
                              SizedBoxHelper.h5,
                              CustomText(
                                text: 'Chicago, IL United States',
                                style: AppFonts.medium,
                                color: AppColors.grey,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: AppColors.primary,
                                      size: 15,
                                    ),
                                    SizedBoxHelper.w5,
                                    CustomText(
                                      text: '1 KM',
                                      style: AppFonts.small,
                                      color: AppColors.primary,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBoxHelper.h30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: 'About',
                                style: AppFonts.largeBold,
                                color: AppColors.black,
                              ),
                              SizedBoxHelper.h5,
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.9,
                                child: const CustomText(
                                  text: 'My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..',
                                  style: AppFonts.small,
                                  color: AppColors.grey,
                                  textAlign: TextAlign.justify,
                                  ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
