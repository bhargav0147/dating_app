import 'package:dating_app/app/config/app_variables.dart';
import 'package:dating_app/app/modules/signup/signup_controller.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:dating_app/app/utils/snackbars.dart';
import 'package:dating_app/app/validator/textfild_validator.dart';
import 'package:dating_app/app/widgets/back_button.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:dating_app/app/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_phone_textfiled.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final SignupController signupController = Get.put(SignupController());
    TextEditingController txtEmail =
        TextEditingController(text: 'bhargavpatel6832@gmail.com');
    TextEditingController txtPhoneNumber =
        TextEditingController(text: '9898637200');
    TextEditingController txtPassword = TextEditingController(text: '123456');
    TextEditingController txtUserName = TextEditingController(text: 'Hello1');

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
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return Validators.emailValidator(value);
                },
              ),
              SizedBoxHelper.h10,
              CustomPhoneTextField(
                hintText: 'Phone Number',
                controller: txtPhoneNumber,
                onChanged: (value) {
                  signupController.mobileNumber.value = value.number;
                  signupController.countryCode.value = value.countryCode;
                },
                onCountryChanged: (value) {
                  signupController.countryCode.value = value.regionCode;
                },
              ),
              SizedBoxHelper.h10,
              CustomTextField(
                hintText: 'Password',
                controller: txtPassword,
                keyboardType: TextInputType.text,
                validator: (value) {
                  return Validators.passwordValidator(value);
                },
                obscureText: true,
              ),
              SizedBoxHelper.h10,
              CustomTextField(
                hintText: 'User Name',
                controller: txtUserName,
                keyboardType: TextInputType.text,
                validator: (value) {
                  return Validators.userNameValidator(value);
                },
              ),
              SizedBoxHelper.h35,
              Obx(
                () => CustomButton(
                  label: 'Continue',
                  isLoading: signupController.isButtonLoading.value,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                     if(signupController.mobileNumber.value.isNotEmpty && signupController.countryCode.value.isNotEmpty)
                       {
                         signupController.sendOtp(
                             email: txtEmail.text,
                             userName: txtUserName.text,
                             password: txtPassword.text,
                             context: context);
                       }else{
                       SnackbarUtils.showInfo(context, 'Please Enter Mobile Number');
                     }
                    }
                  },
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
