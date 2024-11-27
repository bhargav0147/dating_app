import 'package:dating_app/app/assets/image_config.dart';
import 'package:dating_app/app/config/app_variables.dart';
import 'package:dating_app/app/routes/app_routes.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/widgets/back_button.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:dating_app/app/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';

import '../../utils/navigation.dart';
import '../../utils/sized_box_helper.dart';
import '../../validator/textfild_validator.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  alignment: Alignment.centerLeft,
                  child: CustomBackButton()),
                SizedBoxHelper.h30,
                const CustomIcon(
                  icon: Icons.favorite,
                  color: AppColors.primary,
                  size: 100,
                ),
                SizedBoxHelper.h30,
                const CustomText(
                  text: 'Sign In to continue',
                  textAlign: TextAlign.center,
                  color: AppColors.black,
                  style: AppFonts.extraLarge,
                ),
                SizedBoxHelper.h30,
                CustomTextField(
                  hintText: 'Email',
                  onChange: (value) {},
                  validator: (value) {
                    return Validators.emailValidator(value);
                  },
                ),
                SizedBoxHelper.h15,
                CustomTextField(
                  hintText: 'Password',
                  onChange: (value) {},
                  validator: (value) {
                    return Validators.passwordValidator(value);
                  },
                ),
                SizedBoxHelper.h15,
                const Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: 'Forgot Password?',
                      color: AppColors.purple,
                      style: AppFonts.medium,
                    )),
                SizedBoxHelper.h15,
                CustomButton(
                  label: 'Sign In',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      NavigationUtils.replaceWith(AppRoutes.dashbaord);
                    }
                  },
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.white,
                  isLoading: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
