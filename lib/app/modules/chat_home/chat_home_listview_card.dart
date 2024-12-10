import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/sized_box_helper.dart';
import '../../widgets/custom_text.dart';

class ChatHomeListViewCard extends StatelessWidget {
  const ChatHomeListViewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color(0xffF27121),
                Color(0xffE94057),
                Color(0xff8A2387),
              ])),
          child: Center(
            child: Container(
              height: 55,
              width: 55,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white),
              child: const Padding(
                padding: EdgeInsets.all(3),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/1391499/pexels-photo-1391499.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                ),
              ),
            ),
          ),
        ),
        SizedBoxHelper.w10,
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'User Name',
              style: AppFonts.mediumBold,
              color: AppColors.black,
            ),
            SizedBoxHelper.h5,
            CustomText(
              text: 'User Chat Message',
              style: AppFonts.small,
              color: AppColors.black,
            ),
          ],
        ),
        SizedBoxHelper.h10,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomText(
                text: '23 Min',
                style: AppFonts.smallBold,
                color: AppColors.grey,
              ),
              SizedBoxHelper.h5,
              Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: const Center(
                  child: CustomText(
                    text: '1',
                    style: AppFonts.extraSmallBold,
                    color: AppColors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
