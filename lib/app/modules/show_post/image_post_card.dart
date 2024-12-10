import 'package:flutter/material.dart';

import '../../config/app_variables.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/sized_box_helper.dart';
import '../../widgets/customCachedNetworkImage.dart';
import '../../widgets/custom_text.dart';

class ImagePostCard extends StatelessWidget {
  const ImagePostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(

            left: AppVariables.APPSIDESPACING,
            right: AppVariables.APPSIDESPACING,
          ),
          child: Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Color(0xffF27121),
                      Color(0xffE94057),
                      Color(0xff8A2387),
                    ])),
                child: Center(
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.white),
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
              const CustomText(
                text: 'User Name',
                style: AppFonts.mediumBold,
                color: AppColors.black,
              ),
              const Spacer(),
              const Icon(Icons.more_vert,
                size: 20,
                color: AppColors.black,
              )
            ],
          ),
        ),
        SizedBoxHelper.h10,
        const CustomCachedNetworkImage(
          borderRadius: 0,
          height: 450,
          width: double.maxFinite,
          imageUrl:
              'https://images.pexels.com/photos/1391499/pexels-photo-1391499.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ),
        SizedBoxHelper.h10,
        const Padding(
          padding: EdgeInsets.only(
            left: AppVariables.APPSIDESPACING,
            right: AppVariables.APPSIDESPACING,
          ),
          child: Row(
            children: [
              Icon( Icons.favorite,
                size: 24,
                color: AppColors.primary,
              ),
              SizedBoxHelper.w15,
              Icon(Icons.message,
                size: 24,
                color: AppColors.black,
              ),
              SizedBoxHelper.w15,
              Icon( Icons.send,
                size: 24,
                color: AppColors.black,
              ),
              Spacer(),
              Icon( Icons.bookmark,
                size: 24,
                color: AppColors.black,
              ),
            ],
          ),
        ),
        SizedBoxHelper.h10,
        const Padding(
          padding: EdgeInsets.only(
            left: AppVariables.APPSIDESPACING,
            right: AppVariables.APPSIDESPACING,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: '20,223 likes',
              style: AppFonts.mediumBold,
              color: AppColors.black,
            ),
          ),
        ),
        SizedBoxHelper.h10,
        const Padding(
          padding: EdgeInsets.only(
              left: AppVariables.APPSIDESPACING,
              right: AppVariables.APPSIDESPACING),
          child: CustomText(
            text:
                'Tokio I have filmed a small vlog of north Dhaka, andI’m very excited to post on YouTube, will 🤭',
            style: AppFonts.small,
            color: AppColors.black,
          ),
        ),
        SizedBoxHelper.h10,
        const Padding(
          padding: EdgeInsets.only(
            left: AppVariables.APPSIDESPACING,
            right: AppVariables.APPSIDESPACING,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: 'View all 1,012 comments',
              style: AppFonts.smallBold,
              color: AppColors.grey,
            ),
          ),
        ),
        SizedBoxHelper.h10,
      ],
    );
  }
}
