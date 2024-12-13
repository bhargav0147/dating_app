import 'package:dating_app/app/modules/reels/reels_controller.dart';
import 'package:dating_app/app/modules/reels/reels_viewer.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReelsView extends StatelessWidget {
  const ReelsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ReelsViewController reelsViewController = Get.put(ReelsViewController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ReelsViewer(
          reelsList: reelsViewController.reelsList,
      showAppbar: false,
        showProgressIndicator: true,
        showVerifiedTick: true,
        onComment: (p0) {

        },
        onLike: (p0) {

        },
        onClickMoreBtn: () {

        },
        onFollow: () {

        },
        onShare: (p0) {

        },
      ),
    );
  }
}
