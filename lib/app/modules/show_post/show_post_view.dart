import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:flutter/material.dart';
import '../../config/app_variables.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../widgets/custom_icon.dart';
import '../../widgets/custom_text.dart';
import 'image_post_card.dart';

class ShowPostView extends StatelessWidget {
  const ShowPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: AppVariables.APPTOPSPACING,
          bottom: AppVariables.APPBOTTOMSPACING,
        ),
        child: Flexible(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppVariables.APPSIDESPACING),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: 'Dating App',
                      style: AppFonts.veryExtraLarge,
                      color: AppColors.black,
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(
                            color: AppColors.black.shade100.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: CustomIcon(
                          icon: Icons.message,
                          color: AppColors.primary,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBoxHelper.h10,
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const ImagePostCard();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBoxHelper.h10;
                    },
                    itemCount: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
