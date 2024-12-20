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
                        Obx(() {
                          final image =
                              multipleImagesController.selectedProfileImage.value;
                          return GestureDetector(
                            onTap: () async {
                              await multipleImagesController.pickImage(
                                  multipleImagesController.selectedProfileImage);
                            },
                            child: DottedBorder(
                              color: AppColors.primary.shade300,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(15),
                              dashPattern: const [
                                6,
                                3
                              ],
                              child: Container(
                                height: 255,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  image: image != null
                                      ? DecorationImage(
                                    image: kIsWeb
                                        ? MemoryImage(image)
                                        : FileImage(image as File)
                                    as ImageProvider,
                                    fit: BoxFit.cover,
                                  )
                                      : null,
                                ),
                                child: image == null
                                    ? const Icon(
                                  Icons.person,
                                  color: AppColors.primary,
                                  size: 80,
                                )
                                    : null,
                              ),
                            ),
                          );
                        }),
                        SizedBoxHelper.h10,
                        Row(
                          children: [
                            Expanded(
                              child: Obx(() {
                                final image =
                                    multipleImagesController.firstImage.value;
                                return GestureDetector(
                                  onTap: () async {
                                    await multipleImagesController.pickImage(
                                        multipleImagesController.firstImage);
                                  },
                                  child: DottedBorder(
                                    color: AppColors.primary.shade300,
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(15),
                                    dashPattern: const [
                                      6,
                                      3
                                    ], // Optional: Customize the dotted border
                                    child: Container(
                                      height: 120,

                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        image: image != null
                                            ? DecorationImage(
                                          image: kIsWeb
                                              ? MemoryImage(image)
                                              : FileImage(image as File)
                                          as ImageProvider,
                                          fit: BoxFit.cover,
                                        )
                                            : null,
                                      ),
                                      child: image == null
                                          ? Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.add_circle,
                                              color: AppColors.primary,
                                              size: 40),
                                          const SizedBox(height: 10),
                                          CustomText(
                                            text: 'Add Image',
                                            style: AppFonts.mediumBold,

                                            textAlign: TextAlign.center,
                                            color: AppColors.grey.shade500,
                                          ),
                                        ],
                                      )
                                          : null,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBoxHelper.w10,
                            Expanded(
                              child: Obx(() {
                                final image =
                                    multipleImagesController.secondImage.value;
                                return GestureDetector(
                                  onTap: () async {
                                    await multipleImagesController.pickImage(
                                        multipleImagesController.secondImage);
                                  },
                                  child: DottedBorder(
                                    color: AppColors.primary.shade300,
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(15),
                                    dashPattern: const [
                                      6,
                                      3
                                    ], // Optional: Customize the dotted border
                                    child: Container(
                                      height: 120,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        image: image != null
                                            ? DecorationImage(
                                          image: kIsWeb
                                              ? MemoryImage(image)
                                              : FileImage(image as File)
                                          as ImageProvider,
                                          fit: BoxFit.cover,
                                        )
                                            : null,
                                      ),
                                      child: image == null
                                          ? Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.add_circle,
                                              color: AppColors.primary,
                                              size: 40),
                                          const SizedBox(height: 10),
                                          CustomText(
                                            text: 'Add Image',
                                            style: AppFonts.mediumBold,
                                            textAlign: TextAlign.center,
                                            color: AppColors.grey.shade500,
                                          ),
                                        ],
                                      )
                                          : null,
                                    ),
                                  ),
                                );
                              }),
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
                        Obx(() {
                          final image = multipleImagesController.firstImage.value;
                          return GestureDetector(
                            onTap: () async {
                              await multipleImagesController
                                  .pickImage(multipleImagesController.firstImage);
                            },
                            child: DottedBorder(
                              color: AppColors.primary.shade300,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(15),
                              dashPattern: const [
                                6,
                                3
                              ], // Optional: Customize the dotted border
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width * 0.29,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: image != null
                                      ? DecorationImage(
                                    image: kIsWeb
                                        ? MemoryImage(image)
                                        : FileImage(image as File)
                                    as ImageProvider,
                                    fit: BoxFit.cover,
                                  )
                                      : null,
                                ),
                                child: image == null
                                    ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add_circle,
                                        color: AppColors.primary, size: 40),
                                    const SizedBox(height: 10),
                                    CustomText(
                                      text: 'Add Image',
                                      style: AppFonts.mediumBold,

                                      textAlign: TextAlign.center,
                                      color: AppColors.grey.shade500,
                                    ),
                                  ],
                                )
                                    : null,
                              ),
                            ),
                          );
                        }),
                        SizedBoxHelper.h10,
                        Obx(() {
                          final image = multipleImagesController.firstImage.value;
                          return GestureDetector(
                            onTap: () async {
                              await multipleImagesController
                                  .pickImage(multipleImagesController.firstImage);
                            },
                            child: DottedBorder(
                              color: AppColors.primary.shade300,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(15),
                              dashPattern: const [
                                6,
                                3
                              ], // Optional: Customize the dotted border
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width * 0.29,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: image != null
                                      ? DecorationImage(
                                    image: kIsWeb
                                        ? MemoryImage(image)
                                        : FileImage(image as File)
                                    as ImageProvider,
                                    fit: BoxFit.cover,
                                  )
                                      : null,
                                ),
                                child: image == null
                                    ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add_circle,
                                        color: AppColors.primary, size: 40),
                                    const SizedBox(height: 10),
                                    CustomText(
                                      text: 'Add Image',
                                      style: AppFonts.mediumBold,
                                      textAlign: TextAlign.center,
                                      color: AppColors.grey.shade500,
                                    ),
                                  ],
                                )
                                    : null,
                              ),
                            ),
                          );
                        }),
                        SizedBoxHelper.h10,
                        Obx(() {
                          final image = multipleImagesController.firstImage.value;
                          return GestureDetector(
                            onTap: () async {
                              await multipleImagesController
                                  .pickImage(multipleImagesController.firstImage);
                            },
                            child: DottedBorder(
                              color: AppColors.primary.shade300,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(15),
                              dashPattern: const [
                                6,
                                3
                              ], // Optional: Customize the dotted border
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width * 0.29,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: image != null
                                      ? DecorationImage(
                                    image: kIsWeb
                                        ? MemoryImage(image)
                                        : FileImage(image as File)
                                    as ImageProvider,
                                    fit: BoxFit.cover,
                                  )
                                      : null,
                                ),
                                child: image == null
                                    ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add_circle,
                                        color: AppColors.primary, size: 40),
                                    const SizedBox(height: 10),
                                    CustomText(
                                      text: 'Add Image',
                                      style: AppFonts.mediumBold,
                                      textAlign: TextAlign.center,
                                      color: AppColors.grey.shade500,
                                    ),
                                  ],
                                )
                                    : null,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBoxHelper.h35,
              Obx(() {
                final allImagesPicked =
                    multipleImagesController.selectedProfileImage.value !=
                            null &&
                        multipleImagesController.firstImage.value != null &&
                        multipleImagesController.secondImage.value != null;

                return Visibility(
                  visible: allImagesPicked,
                  child: CustomButton(
                    label: 'Continue',
                    onPressed: () {
                      // NavigationUtils.navigateTo(AppRoutes.gender);
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
