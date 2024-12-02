import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:flutter/material.dart';
import '../../config/app_variables.dart';
import 'image_post_card.dart';

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
              return const ImagePostCard();
            },
            separatorBuilder: (context, index) {
              return SizedBoxHelper.h10;
            },
            itemCount: 15),
      ),
    );
  }
}
