// ignore_for_file: unnecessary_null_comparison

import 'package:dating_app/app/config/app_variables.dart';
import 'package:dating_app/app/modules/signup/signup_controller.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:dating_app/app/utils/snackbars.dart';
import 'package:dating_app/app/widgets/back_button.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:dating_app/app/widgets/custom_dropdown.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../validator/textfild_validator.dart';
import '../../widgets/customDatePicker.dart';
import '../../widgets/custom_textfiled.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: AppVariables.APPBOTTOMSPACING,
            top: AppVariables.APPTOPSPACING,
            left: AppVariables.APPSIDESPACING,
            right: AppVariables.APPSIDESPACING,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                SizedBoxHelper.h10,
                const CustomText(
                  text: 'Sign Up',
                  style: AppFonts.extraLarge,
                  color: AppColors.black,
                ),
                SizedBoxHelper.h20,
                 CustomText(
                  text:
                      'Please enter your personal details to create a new account.',
                  style: AppFonts.extraSmall,
                  color: AppColors.grey.shade700,
                  textAlign: TextAlign.start,
                ),
                SizedBoxHelper.h30,
                CustomTextField(
                  hintText: 'Full Name',
                  keyboardType: TextInputType.text,
                  onChange: (value) {},
                  validator: (value) {
                    return Validators.userNameValidator(value);
                  },
                ),
                SizedBoxHelper.h15,
                CustomTextField(
                  hintText: 'User Name',
                  keyboardType: TextInputType.text,
                  onChange: (value) {},
                  validator: (value) {
                    return Validators.userNameValidator(value);
                  },
                ),
                SizedBoxHelper.h15,
                CustomTextField(
                  hintText: 'Email',
                  onChange: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return Validators.emailValidator(value);
                  },
                ),
                SizedBoxHelper.h15,
                CustomTextField(
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.number,
                  onChange: (value) {},
                  validator: (value) {
                    return Validators.phoneValidator(value);
                  },
                ),
                SizedBoxHelper.h15,
                CustomTextField(
                  hintText: 'Password',
                  keyboardType: TextInputType.text,
                  onChange: (value) {},
                  validator: (value) {
                    return Validators.passwordValidator(value);
                  },
                ),
                SizedBoxHelper.h15,
                CustomDropdown(
                  options: controller.genderOptions,
                  hintText: 'Select Gender',
                  onChanged: (value) {
                    controller.selectedGender.value = value ?? '';
                  },
                  validator: (value) {
                    return Validators.genderValidator(value);
                  },
                ),
                SizedBoxHelper.h15,
                GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await DatePickerHelper.pickDate(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900), // minimum year for birth date
                      lastDate: DateTime.now(), // disallow future dates
                    );

                    if (selectedDate != null) {
                      controller.selectedBirthDate.value =
                          selectedDate.toString();
                    }
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey.shade600),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            controller.selectedBirthDate.value.isEmpty
                                ? 'Select Birth Date'
                                : controller.selectedBirthDate.value
                                    .split(' ')[0],
                            style: AppFonts.medium.copyWith(
                                color:
                                    controller.selectedBirthDate.value.isEmpty
                                        ? AppColors.grey.shade900
                                        : AppColors.black),
                          ),
                        ),
                        const CustomIcon(
                          icon: Icons.calendar_today,
                          color: AppColors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBoxHelper.h30,
                CustomButton(
                  label: 'Sign Up',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      SnackbarUtils.showError('Sign Up Successfull');
                    }
                  },
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
