import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/sized_box_helper.dart';
import '../../widgets/custom_text.dart';

class ChatHomeStoryCard extends StatelessWidget {
  const ChatHomeStoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color(0xffF27121),
                Color(0xffE94057),
                Color(0xff8A2387),
              ])),
          child: Center(
            child: Container(
              height: 75,
              width: 75,
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
        SizedBoxHelper.h5,
        const CustomText(
          text: 'User Name',
          style: AppFonts.smallBold,
          color: AppColors.black,
        )
      ],
    );
  }
}
