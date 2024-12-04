import 'package:dating_app/app/config/app_variables.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:dating_app/app/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';

import '../../utils/sized_box_helper.dart';
import 'chat_home_listview_card.dart';
import 'chat_home_stroy_card.dart';

class ChatHomeView extends StatelessWidget {
  const ChatHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
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
                const CustomText(
                  text: 'Messages',
                  style: AppFonts.veryExtraLarge,
                  color: AppColors.black,
                ),
                    SizedBoxHelper.h10,
                const CustomTextField(
                  hintText: 'Search',
                  keyboardType: TextInputType.text,
                  ifLeading: true,
                  leadingIcon: Icons.search,
                  leadingIconColor: AppColors.black,
                ),
                SizedBoxHelper.h10,
                const CustomText(
                  text: 'Activities',
                  color: AppColors.black,
                  style: AppFonts.extramediumBold,
                ),
                SizedBoxHelper.h10,
                SizedBox(
                  height: 105,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const ChatHomeStoryCard();
                    },
                    itemCount: 15,
                    separatorBuilder: (context, index) {
                      return SizedBoxHelper.w15;
                    },
                  ),
                ),
                SizedBoxHelper.h10,
                const CustomText(
                  text: 'Messages',
                  color: AppColors.black,
                  style: AppFonts.extramediumBold,
                ),
                SizedBoxHelper.h10,
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const ChatHomeListViewCard();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBoxHelper.h10;
                    },
                    itemCount: 15)
              ],
            ),
          ),
        ));
  }
}
