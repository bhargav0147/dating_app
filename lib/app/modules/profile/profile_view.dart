import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/app/modules/profile/profile_controller.dart';
import 'package:dating_app/app/routes/app_routes.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/utils/navigation.dart';
import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/app_variables.dart';
import '../../utils/fixedWidthIndicator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: AppColors.white,
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
                  const CustomText(
                    text: 'bkhush_312',
                    style: AppFonts.extraLarge,
                    color: AppColors.black,
                  ),
                  const Spacer(),
                  const CustomIcon(
                    icon: Icons.add_circle,
                    size: 25,
                    color: AppColors.primary,
                  ),
                  SizedBoxHelper.w15,
                  GestureDetector(
                    onTap: () {
                      NavigationUtils.navigateTo(AppRoutes.settings);
                    },
                    child: const CustomIcon(
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
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: ClipRRect(
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
                  ),
                  const Spacer(),
                  const Column(
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
                  const Spacer(),
                  const Column(
                    children: [
                      CustomText(
                        text: '652',
                        style: AppFonts.mediumBold,
                        color: AppColors.black,
                      ),
                      SizedBoxHelper.h5,
                      CustomText(
                        text: 'friends',
                        style: AppFonts.mediumBold,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              SizedBoxHelper.h15,
              const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Bhargav Kalariya',
                    style: AppFonts.mediumBold,
                    color: AppColors.black,
                  )),
              SizedBoxHelper.h5,
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Surat, Gujarat, India',
                  style: AppFonts.medium,
                  color: AppColors.black,
                ),
              ),
              SizedBoxHelper.h5,
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                  style: AppFonts.small,
                  color: AppColors.black,
                ),
              ),
              SizedBoxHelper.h15,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primary.withOpacity(0.1)),
                      child: const Center(
                        child: CustomText(
                          text: 'Edit Profile',
                          style: AppFonts.smallBold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBoxHelper.w10,
                  Expanded(
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primary.withOpacity(0.1)),
                      child: const Center(
                        child: CustomText(
                          text: 'Share Profile',
                          style: AppFonts.smallBold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBoxHelper.h15,
              DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      dividerColor: AppColors.grey.shade300,
                      onTap: controller.chnageTabbarIndex,
                      indicator: const FixedWidthIndicator(
                        height: 2,
                        width: 40,
                        color: AppColors.primary,
                      ),
                      tabs: const [
                        Tab(
                            icon: CustomIcon(
                          icon: Icons.image,
                          size: 24,
                          color: AppColors.primary,
                        )),
                        Tab(
                            icon: CustomIcon(
                          icon: Icons.video_collection_outlined,
                          size: 24,
                          color: AppColors.primary,
                        )),
                      ],
                    ),
                    SizedBoxHelper.h15,
                    Obx(
                      () => controller.tabBarIndex.value == 0
                          ? GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: 40,
                              itemBuilder: (context, index) {
                                return CachedNetworkImage(
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
                                      const Icon(Icons.error,
                                          color: AppColors.red),
                                );
                              },
                            )
                          : GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: 40,
                              itemBuilder: (context, index) {
                                return CachedNetworkImage(
                                  imageUrl:
                                      'https://images.pexels.com/photos/616376/pexels-photo-616376.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error,
                                          color: AppColors.red),
                                );
                              },
                            ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
