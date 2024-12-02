import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../config/app_variables.dart';
import '../../theme/colors.dart';

class ShowPostView extends StatelessWidget {
  const ShowPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: AppVariables.APPTOPSPACING,
          bottom: AppVariables.APPBOTTOMSPACING,
        ),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: AppColors.grey.shade300, width: 1))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
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
                          const CustomText(
                            text: 'User Name',
                            style: AppFonts.mediumBold,
                            color: AppColors.black,
                          ),
                          const Spacer(),
                          const CustomIcon(
                            icon: Icons.more_vert,
                            size: 20,
                            color: AppColors.black,
                          )
                        ],
                      ),
                    ),
                    SizedBoxHelper.h10,
                    CachedNetworkImage(
                      imageUrl:
                          'https://images.pexels.com/photos/1391499/pexels-photo-1391499.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      width: double.maxFinite,
                      height: 450,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, color: AppColors.red),
                    ),
                    SizedBoxHelper.h10,
                    const Padding(
                      padding: EdgeInsets.only(
                        left: AppVariables.APPSIDESPACING,
                        right: AppVariables.APPSIDESPACING,
                      ),
                      child: Row(
                        children: [
                          CustomIcon(
                            icon: Icons.favorite,
                            size: 24,
                            color: AppColors.primary,
                          ),
                          SizedBoxHelper.w15,
                          CustomIcon(
                            icon: Icons.message,
                            size: 24,
                            color: AppColors.black,
                          ),
                          SizedBoxHelper.w15,
                          CustomIcon(
                            icon: Icons.send,
                            size: 24,
                            color: AppColors.black,
                          ),
                          Spacer(),
                          CustomIcon(
                            icon: Icons.bookmark,
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
                          style: AppFonts.mediumBold,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                    SizedBoxHelper.h10,
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBoxHelper.h10;
            },
            itemCount: 15),
      ),
    );
  }
}