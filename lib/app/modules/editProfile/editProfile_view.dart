import 'package:dating_app/app/modules/editProfile/editProfile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';

import '../../utils/sized_box_helper.dart';
import '../../validator/textfild_validator.dart';
import '../../widgets/back_button.dart';
import '../../widgets/customDatePicker.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfiled.dart';

class EditprofileView extends StatelessWidget {
  const EditprofileView({super.key});

  @override
  Widget build(BuildContext context) {
    final EditprofileController controller = Get.put(EditprofileController());
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
                text: 'Profile details',
                style: AppFonts.veryExtraLarge,
                color: AppColors.black,
              ),
              SizedBoxHelper.h35,
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.grey.shade100),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const CustomIcon(
                          icon: Icons.person,
                          color: AppColors.primary,
                          size: 80,
                        ),
                      ),
                      Align(
                        alignment: const Alignment(1.3, 1.3),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            border:
                                Border.all(color: AppColors.white, width: 3),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const CustomIcon(
                            icon: Icons.camera_alt_rounded,
                            color: AppColors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBoxHelper.h35,
              CustomTextField(
                hintText: 'First Name',
                keyboardType: TextInputType.text,
                validator: (value) {
                  return Validators.fullNameValidator(value);
                },
              ),
              SizedBoxHelper.h15,
              CustomTextField(
                hintText: 'Last Name',
                keyboardType: TextInputType.text,
                validator: (value) {
                  return Validators.fullNameValidator(value);
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
                  height: 58,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        const CustomIcon(
                          icon: Icons.calendar_today_outlined,
                          size: 20,
                          color: AppColors.primary,
                        ),
                        SizedBoxHelper.w10,
                        Obx(
                          () => Text(
                            controller.selectedBirthDate.value.isEmpty
                                ? 'Choose birthday date'
                                : controller.selectedBirthDate.value
                                    .split(' ')[0],
                            style: AppFonts.medium
                                .copyWith(color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBoxHelper.h35,
              CustomButton(
                label: 'Confirm',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // NavigationUtils.navigateTo(AppRoutes.otp);
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