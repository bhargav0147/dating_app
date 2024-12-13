import 'package:dating_app/app/config/app_variables.dart';
import 'package:dating_app/app/routes/app_routes.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/utils/navigation.dart';
import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(
            top: AppVariables.APPTOPSPACING,
            bottom: AppVariables.APPBOTTOMSPACING),
        child: Column(
          children: [
            CarouselSlider(
              items: controller.onboardingDetails.map((detail) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        detail['image']!,
                        height: screenHeight * 0.45,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBoxHelper.h45,
                    CustomText(
                      text: detail['title'].toString(),
                      color: AppColors.primary,
                      style: AppFonts.extraLarge,
                    ),
                    SizedBoxHelper.h10,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: CustomText(
                        text: detail['description'].toString(),
                        color: AppColors.black,
                        style: AppFonts.extraSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBoxHelper.h10,
                  ],
                );
              }).toList(),
              options: CarouselOptions(
                height: screenHeight * 0.7,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  controller.pageIndex.value = index;
                },
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.onboardingDetails.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    height: 10,
                    width: controller.pageIndex.value == index ? 20 : 10,
                    decoration: BoxDecoration(
                      color: controller.pageIndex.value == index
                          ? AppColors.primary
                          : AppColors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBoxHelper.h30,
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppVariables.APPSIDESPACING),
              child: CustomButton(
                  label: 'Create an Account',
                  onPressed: () {
                    NavigationUtils.navigateTo(AppRoutes.welcome);
                  },
                  isLoading: false),
            ),
            SizedBoxHelper.h20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: 'Already have an account? ',
                  style: AppFonts.extraSmall,
                  color: AppColors.black,
                ),
                GestureDetector(
                  onTap: () {
                    NavigationUtils.navigateTo(AppRoutes.login);
                  },
                  child: const CustomText(
                    text: 'Sign In',
                    style: AppFonts.extraSmallBold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
