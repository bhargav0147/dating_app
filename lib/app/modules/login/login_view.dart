import 'dart:math';

import 'package:dating_app/app/config/app_variables.dart';
import 'package:dating_app/app/modules/login/login_controller.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/widgets/back_button.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:dating_app/app/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/sized_box_helper.dart';
import '../../validator/textfild_validator.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    TextEditingController txtEmail = TextEditingController(text: 'knikniknikni506@gmail.com');
    TextEditingController txtPassword = TextEditingController(text: 'password');
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(
            top: AppVariables.APPTOPSPACING,
            bottom: AppVariables.APPBOTTOMSPACING,
            left: AppVariables.APPSIDESPACING,
            right: AppVariables.APPSIDESPACING),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                    alignment: Alignment.centerLeft, child: CustomBackButton()),
                SizedBoxHelper.h30,
                const Icon(Icons.favorite,
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
                  controller: txtEmail,
                  onChange: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return Validators.emailValidator(value);
                  },
                ),
                SizedBoxHelper.h15,
                CustomTextField(
                  hintText: 'Password',
                  controller: txtPassword,
                  keyboardType: TextInputType.text,
                  onChange: (value) {},
                  validator: (value) {
                    return Validators.passwordValidator(value);
                  },
                  obscureText: true,
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
                Obx(
                  () =>  CustomButton(
                    label: 'Sign In',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginController.login(email: txtEmail.text, password: txtPassword.text,context: context);
                      }
                    },
                    backgroundColor: AppColors.primary,
                    textColor: AppColors.white,
                    isLoading: loginController.isLoading.value,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
