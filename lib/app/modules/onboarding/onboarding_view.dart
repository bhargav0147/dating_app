import 'package:dating_app/app/config/app_variables.dart';
import 'package:dating_app/app/routes/app_routes.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/utils/mediaQueryHelper.dart';
import 'package:dating_app/app/utils/navigation.dart';
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
    return Scaffold(
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
                        height: MediaQueryHelper.getHeightPercentage(45),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 44),
                    CustomText(
                      text: detail['title'].toString(),
                      color: AppColors.primary,
                      style: AppFonts.extraLarge,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: CustomText(
                        text: detail['description'].toString(),
                        color: AppColors.black,
                        style: AppFonts.extraSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              }).toList(),
              options: CarouselOptions(
                height: MediaQueryHelper.getHeightPercentage(70),
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
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppVariables.APPSIDESPACING),
              child: CustomButton(
                  label: 'Create an Account',
                  onPressed: () {},
                  isLoading: false),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: 'Already have an account? ',
                  style: AppFonts.extraSmall,
                  color: AppColors.black,
                ),
                InkWell(
                  onTap: () {
                    NavigationUtils.replaceWith(AppRoutes.login);
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
