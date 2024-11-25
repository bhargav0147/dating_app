import 'package:dating_app/app/routes/app_routes.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/utils/navigation.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_controller.dart'; // Import the controller

class OnboardingView extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: controller.changePage,
              itemCount: controller.onboardingDetails.length,
              itemBuilder: (context, index) {
                final detail = controller.onboardingDetails[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        detail['image']!,
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomText(
                        text: detail['description']!,
                        color: AppColors.black,
                        style: AppFonts.large,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.onboardingDetails.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: controller.pageIndex.value == index ? 20 : 10,
                  height: 8,
                  decoration: BoxDecoration(
                    color: controller.pageIndex.value == index
                        ? AppColors.primary
                        : AppColors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 30),
          Obx(() {
            return controller.pageIndex.value ==
                    controller.onboardingDetails.length - 1
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomButton(
                      label: 'Login',
                      onPressed: () {
                        NavigationUtils.replaceWith(AppRoutes.login);
                      },
                      height: 55,
                      width: double.maxFinite,
                      backgroundColor: AppColors.primary,
                      borderRadius: 100,
                      isLoading: false,
                      textColor: AppColors.white,
                    ),
                  )
                : const SizedBox(height: 55,);
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
