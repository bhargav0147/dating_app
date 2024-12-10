import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:flutter/material.dart';
import '../../config/app_variables.dart';
import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../widgets/custom_text.dart';
import 'image_post_card.dart';

class ShowPostView extends StatelessWidget {
  const ShowPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            pinned: false,
            snap: true,
            scrolledUnderElevation: 0,
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(horizontal: AppVariables.APPSIDESPACING,vertical: 15),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Dating App',
                    style: AppFonts.largeBold,
                    color: AppColors.black,
                  ),
                  Icon(Icons.add_circle,
                    size: 25,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Column(
                  children: [
                    const ImagePostCard(),
                    SizedBoxHelper.h5,
                  ],
                );
              },
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
