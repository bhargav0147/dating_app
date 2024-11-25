import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:dating_app/app/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';

class ChatHomeView extends StatelessWidget {
  const ChatHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextField(
              hintText: 'Search',
              ifLeading: true,
              leadingIcon: Icons.search,
              leadingIconColor: AppColors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: 'New Matches',
              color: AppColors.black,
              style: AppFonts.large,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 105,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.primary),
                        child: const Padding(
                          padding: EdgeInsets.all(2),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/1391499/pexels-photo-1391499.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const CustomText(
                        text: 'User Name',
                        style: AppFonts.small,
                        color: AppColors.black,
                      )
                    ],
                  );
                },
                itemCount: 15,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: 'Messages',
              color: AppColors.black,
              style: AppFonts.large,
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary),
                        child: const Padding(
                          padding: EdgeInsets.all(2),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/1391499/pexels-photo-1391499.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                          ),
                        ),
                      ),
                      SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'User Name',
                                style: AppFonts.medium,
                                color: AppColors.black,
                              ),
                              CustomText(
                                text: 'User Chat Message',
                                style: AppFonts.small,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  text: '23 Min',
                                  style: AppFonts.medium,
                                  color: AppColors.black,
                                ),
                                CustomText(
                                  text: '10+',
                                  style: AppFonts.small,
                                  color: AppColors.black,
                                ),
                              ],
                            ),
                          )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 15)
          ],
        ),
      ),
    );
  }
}
