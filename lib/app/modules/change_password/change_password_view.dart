import 'package:dating_app/app/modules/change_password/change_password_controller.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';
import '../../theme/fonts.dart';
import '../../utils/sized_box_helper.dart';
import '../../validator/textfild_validator.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfiled.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController changePasswordController =
        Get.put(ChangePasswordController());
    final formKey = GlobalKey<FormState>();
    TextEditingController txtOldPassword =
        TextEditingController(text: 'password');
    TextEditingController txtNewPassword =
        TextEditingController(text: 'password');
    TextEditingController txtConfirmNewPassword =
        TextEditingController(text: 'password');
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: AppVariables.APPTOPSPACING,
                bottom: AppVariables.APPBOTTOMSPACING,
                left: AppVariables.APPSIDESPACING,
                right: AppVariables.APPSIDESPACING),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                    alignment: Alignment.centerLeft, child: CustomBackButton()),
                SizedBoxHelper.h30,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Change Password',
                    style: AppFonts.veryExtraLarge,
                    color: AppColors.black,
                  ),
                ),
                SizedBoxHelper.h30,
                CustomTextField(
                  hintText: 'Old Password',
                  controller: txtOldPassword,
                  onChange: (value) {},
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return Validators.passwordValidator(value);
                  },
                ),
                SizedBoxHelper.h15,
                CustomTextField(
                  hintText: 'New Password',
                  controller: txtNewPassword,
                  keyboardType: TextInputType.text,
                  onChange: (value) {},
                  validator: (value) {
                    return Validators.passwordValidator(value);
                  },
                ),
                SizedBoxHelper.h15,
                CustomTextField(
                  hintText: 'Confirmed New Password',
                  controller: txtConfirmNewPassword,
                  keyboardType: TextInputType.text,
                  onChange: (value) {},
                  validator: (value) {
                    return Validators.confirmPasswordValidator(
                      txtNewPassword.text,
                      value,
                    );
                  },
                ),
                SizedBoxHelper.h30,
                Obx(
                  () => CustomButton(
                    label: 'Submit',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        changePasswordController.changePassword(
                            oldPassword: txtOldPassword.text,
                            newPassword: txtConfirmNewPassword.text,
                            context: context);
                      }
                    },
                    isLoading: changePasswordController.isButtonLoading.value,
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
