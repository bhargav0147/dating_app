import 'package:dating_app/app/modules/otp/otp_controller.dart';
import 'package:dating_app/app/modules/signup/signup_Model.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../config/app_variables.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors.dart';
import '../../utils/navigation.dart';
import '../../utils/sized_box_helper.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpFormModel signUpFormModel = Get.arguments as SignUpFormModel;
    final TextEditingController txtOtp = TextEditingController();
    final OtpController otpController = Get.put(OtpController());
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
                text: 'OTP Verification',
                style: AppFonts.veryExtraLarge,
                color: AppColors.black,
              ),
              CustomText(
                text: 'Type the verification code we’ve sent you',
                style: AppFonts.extraSmall,
                color: AppColors.grey.shade900,
              ),
              SizedBoxHelper.h35,
              Pinput(
                keyboardType: TextInputType.number,
                controller: txtOtp,
                validator: (value) {
                  if (value!.length != 4) {
                    return "Enter Otp";
                  }
                  return null;
                },
                length: 4,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                defaultPinTheme: PinTheme(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.grey.shade500))),
                focusedPinTheme: PinTheme(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.primary))),
                submittedPinTheme: PinTheme(
                    height: 70,
                    width: 70,
                    textStyle:
                        AppFonts.extraLarge.copyWith(color: AppColors.white),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.primary))),
                errorPinTheme: PinTheme(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.red))),
              ),
              SizedBoxHelper.h35,
              Obx(
                () =>  CustomButton(
                  label: 'Continue',
                  isLoading: otpController.isButtonLoading.value,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      signUpFormModel.otp = txtOtp.text;
                      otpController.userRegister(body: signUpFormModel.toJson(), context: context);
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
