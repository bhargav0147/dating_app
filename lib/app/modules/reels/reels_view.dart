import 'package:dating_app/app/modules/reels/reels_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../theme/colors.dart';
import '../../widgets/custom_icon.dart';

class ReelsView extends StatelessWidget {
  const ReelsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ReelsController controller = Get.put(ReelsController());
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) {
              final reelIndex = index % controller.reelsList.length;
              return ReelItem(
                videoPath: controller.reelsList[reelIndex],
                index: reelIndex,
              );
            },
            scrollDirection: Axis.vertical,
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
          ),
          const Positioned(
            bottom: 16.0,
            right: 16.0,
            child: CustomIcon(icon: Icons.more_horiz, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

class ReelItem extends StatelessWidget {
  final String videoPath;
  final int index;

  const ReelItem({required this.videoPath, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ReelsController>(
      init: ReelsController(),
      builder: (controller) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: controller.videoController.value!.value.size.width,
                height: controller.videoController.value!.value.size.height,
                child: VideoPlayer(controller.videoController.value!),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIcon(icon: Icons.favorite, color: AppColors.white),
                CustomIcon(icon: Icons.comment, color: AppColors.white),
                CustomIcon(icon: Icons.share, color: AppColors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
