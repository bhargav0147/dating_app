import 'package:dating_app/app/modules/contacts/contacts_controller.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';
import '../../theme/colors.dart';
import '../../utils/sized_box_helper.dart';
import '../../utils/snackbars.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactsController controller = Get.put(ContactsController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: AppVariables.APPBOTTOMSPACING,
            left: AppVariables.APPSIDESPACING,
            right: AppVariables.APPSIDESPACING,
            top: AppVariables.APPTOPSPACING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBoxHelper.h35,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(),
                CustomText(
                  text: 'Skip',
                  color: AppColors.primary,
                  style: AppFonts.mediumBold,
                ),
              ],
            ),
            SizedBoxHelper.h35,
            Expanded(
              child: Obx(
                () => controller.contactsList.isEmpty
                    ? Column(children: [
                        const CustomIcon(
                          icon: Icons.favorite,
                          size: 150,
                          color: AppColors.primary,
                        ),
                        const Spacer(),
                        const CustomText(
                          text: 'Search friend’s',
                          color: AppColors.black,
                          style: AppFonts.extraLarge,
                        ),
                        CustomText(
                          text:
                              'You can find friends from your contact liststo connected',
                          color: AppColors.grey.shade600,
                          style: AppFonts.medium,
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                      ])
                    : ListView.builder(
                        itemCount: controller.contactsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('$index'),
                          );
                        },
                      ),
              ),
            ),
            CustomButton(
              label: 'Access to a contact list',
              onPressed: () async {
                int contactCount = await controller.getContactFromUser();

                if (contactCount > 0) {
                  SnackbarUtils.showInfo('You have $contactCount contacts.');
                  return;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
