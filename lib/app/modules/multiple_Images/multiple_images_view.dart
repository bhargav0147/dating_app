import 'dart:io';

import 'package:dating_app/app/modules/multiple_Images/multiple_images_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/navigation.dart';
import '../../utils/sized_box_helper.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/imagePickerTile.dart';

class MultipleImagesView extends StatelessWidget {
  const MultipleImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    final MultipleImagesController multipleImagesController =
        Get.put(MultipleImagesController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
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
                text: 'Upload Your Photos',
                style: AppFonts.veryExtraLarge,
                color: AppColors.black,
              ),
              SizedBoxHelper.h35,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        ImagePickerTile(
                          image:
                              multipleImagesController.selectedProfileImage,
                          onPickImage: (image) =>
                              multipleImagesController.pickImage(image),
                          height: 255,
                        ),
                        SizedBoxHelper.h10,
                        Row(
                          children: [
                            Expanded(
                              child: ImagePickerTile(
                                image: multipleImagesController.imageOne,
                                onPickImage: (image) =>
                                    multipleImagesController.pickImage(image),
                                height: 120,
                              ),
                            ),
                            SizedBoxHelper.w10,
                            Expanded(
                              child: ImagePickerTile(
                                image: multipleImagesController.imageTwo,
                                onPickImage: (image) =>
                                    multipleImagesController.pickImage(image),
                                height: 120,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBoxHelper.w10,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImagePickerTile(
                          image: multipleImagesController.imageThree,
                          onPickImage: (image) =>
                              multipleImagesController.pickImage(image),
                          height: 120,
                        ),
                        SizedBoxHelper.h10,
                        ImagePickerTile(
                          image: multipleImagesController.imageFour,
                          onPickImage: (image) =>
                              multipleImagesController.pickImage(image),
                          height: 120,
                        ),
                        SizedBoxHelper.h10,
                        ImagePickerTile(
                          image: multipleImagesController.imageFive,
                          onPickImage: (image) =>
                              multipleImagesController.pickImage(image),
                          height: 120,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBoxHelper.h35,
              CustomButton(
                label: 'Continue',
                onPressed: () async {
                  List<dynamic>? selectedImages =
                      await multipleImagesController.handleImageSelection(context);

                  if (selectedImages != null) {
                    print("Selected Images: $selectedImages");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
