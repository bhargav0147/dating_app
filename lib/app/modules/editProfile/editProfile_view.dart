// ignore_for_file: file_names

import 'package:dating_app/app/modules/editProfile/editProfile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';

import '../../utils/getLocationDetails.dart';
import '../../utils/navigation.dart';
import '../../utils/sized_box_helper.dart';
import '../../utils/snackbars.dart';
import '../../validator/textfild_validator.dart';
import '../../widgets/back_button.dart';
import '../../widgets/customDatePicker.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfiled.dart';

class EditprofileView extends StatelessWidget {
  const EditprofileView({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileController controller = Get.put(EditProfileController());
    final formKey = GlobalKey<FormState>();
    final TextEditingController txtFirstName = TextEditingController();
    final TextEditingController txtLastName = TextEditingController();
    final TextEditingController txtBio = TextEditingController();
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
              CustomTextField(
                hintText: 'First Name',
                controller: txtFirstName,
                keyboardType: TextInputType.text,
                validator: (value) {
                  return Validators.fullNameValidator(value);
                },
              ),
              SizedBoxHelper.h15,
              CustomTextField(
                hintText: 'Last Name',
                controller: txtLastName,
                keyboardType: TextInputType.text,
                validator: (value) {
                  return Validators.fullNameValidator(value);
                },
              ),
              SizedBoxHelper.h15,
              CustomTextField(
                hintText: 'Bio',
                controller: txtBio,
                maxLine: 3,
                keyboardType: TextInputType.text,
                validator: (value) {
                  return Validators.bioValidator(value);
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
                        const Icon(
                          Icons.calendar_today_outlined,
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
              SizedBoxHelper.h15,
              GestureDetector(
                onTap: () async {
                  Map<String, String> locationDetails =
                      await getLocationDetails();

                  controller.city.value = locationDetails['city'].toString();
                  controller.state.value = locationDetails['state'].toString();
                  controller.country.value =
                      locationDetails['country'].toString();
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
                        const Icon(
                          Icons.location_on_rounded,
                          size: 20,
                          color: AppColors.primary,
                        ),
                        SizedBoxHelper.w10,
                        Obx(
                          () => Flexible(
                            child: Text(
                              controller.state.value.isEmpty
                                  ? 'Choose Your Location'
                                  : '${controller.city.value} ${controller.state.value} ${controller.country.value}',
                              style: AppFonts.medium
                                  .copyWith(color: AppColors.primary),
                            ),
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
                    if (controller.selectedBirthDate.value.isEmpty) {
                      SnackbarUtils.showInfo(context, 'Select Your Birth Date');
                      return;
                    }
                    Map<String, String> profileData = {
                      'name': '${txtFirstName.text} ${txtLastName.text}',
                      'city': controller.city.value,
                      'country': controller.country.value,
                      'bio': txtBio.text,
                      'dateOfBirth':
                          controller.selectedBirthDate.value.split(' ')[0]
                    };
                    NavigationUtils.navigateTo(AppRoutes.gender,
                        arguments: profileData);
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
