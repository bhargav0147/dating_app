import 'package:dating_app/app/config/app_variables.dart';
import 'package:dating_app/app/routes/app_routes.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/utils/navigation.dart';
import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:dating_app/app/validator/textfild_validator.dart';
import 'package:dating_app/app/widgets/back_button.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:dating_app/app/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: AppVariables.APPBOTTOMSPACING,
              left: AppVariables.APPSIDESPACING,
              right: AppVariables.APPSIDESPACING,
              top: AppVariables.APPTOPSPACING),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
              SizedBoxHelper.h35,
              const CustomText(
                text: 'Sign Up',
                style: AppFonts.veryExtraLarge,
                color: AppColors.black,
              ),
              CustomText(
                text:
                    'Please enter your valid email address. We will send you a 4-digit code to verify your account.',
                style: AppFonts.extraSmall,
                color: AppColors.grey.shade900,
              ),
              SizedBoxHelper.h35,
              CustomTextField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return Validators.emailValidator(value);
                },
              ),
              SizedBoxHelper.h10,
              CustomTextField(
                hintText: 'Phone Number',
                keyboardType: TextInputType.number,
                validator: (value) {
                  return Validators.phoneValidator(value);
                },
              ),
              SizedBoxHelper.h10,
              CustomTextField(
                hintText: 'Password',
                keyboardType: TextInputType.text,
                validator: (value) {
                  return Validators.passwordValidator(value);
                },
              ),
              SizedBoxHelper.h10,
              CustomTextField(
                hintText: 'User Name',
                keyboardType: TextInputType.text,
                validator: (value) {
                  return Validators.userNameValidator(value);
                },
              ),
              SizedBoxHelper.h35,
              CustomButton(
                label: 'Continue',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    NavigationUtils.navigateTo(AppRoutes.otp);
                  }
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}
