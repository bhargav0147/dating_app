import 'package:dating_app/app/assets/image_config.dart';
import 'package:dating_app/app/routes/app_routes.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../utils/navigation.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30,),
              const CustomText(
                text: 'Let,s you in',
                color: AppColors.white,
                style: AppFonts.large,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'By Clicking Log in, you agree with our ',
                    color: AppColors.white,
                    style: AppFonts.small,
                  ),
                  CustomText(
                    text: 'Terms',
                    color: AppColors.primary,
                    style: AppFonts.small.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary),
                  ),
                  const CustomText(
                    text: '.',
                    color: AppColors.white,
                    style: AppFonts.small,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'Learn how we process your date in our ',
                    color: AppColors.white,
                    style: AppFonts.small,
                  ),
                  CustomText(
                    text: 'Privacy',
                    color: AppColors.primary,
                    style: AppFonts.small.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Policy',
                    color: AppColors.primary,
                    style: AppFonts.small.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary),
                  ),
                  const CustomText(
                    text: ' and  ',
                    color: AppColors.white,
                    style: AppFonts.small,
                  ),
                  CustomText(
                    text: 'Cookies Policy',
                    color: AppColors.primary,
                    style: AppFonts.small.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary),
                  ),
                  const CustomText(
                    text: '.',
                    color: AppColors.white,
                    style: AppFonts.small,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppColors.grey.shade200)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.google,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const CustomText(
                        text: 'Login With Google',
                        style: AppFonts.medium,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppColors.grey.shade200)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.facebook,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const CustomText(
                        text: 'Login With Facebook',
                        style: AppFonts.medium,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppColors.grey.shade200)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.phoneCall,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const CustomText(
                        text: 'Login With Phone',
                        style: AppFonts.medium,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'or',
                color: AppColors.white,
                style: AppFonts.medium,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                label: 'Trouble Logging in?',
                onPressed: () {
                  NavigationUtils.replaceWith(AppRoutes.dashbaord);
                },
                backgroundColor: AppColors.primary,
                height: 55,
                width: double.maxFinite,
                borderRadius: 100,
                textColor: AppColors.white,
                isLoading: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
