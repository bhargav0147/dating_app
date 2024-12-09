import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ReelsController extends GetxController {
  RxList reelsList = [
    'assets/video/reels1.mp4',
    'assets/video/reels2.mp4',
    'assets/video/reels3.mp4',
  ].obs;

  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final Rx<VideoPlayerController?> videoController = Rx<VideoPlayerController?>(null);

  Future<void> initializeVideo(int index) async {
    videoController.value?.dispose();

    final newController = VideoPlayerController.network(reelsList[index]);
    await newController.initialize();
    newController.play();
    newController.setLooping(true);
    videoController.value = newController;
  }

  void onPageChanged(int page) {
    currentPage.value = page;
    initializeVideo(page % reelsList.length);
  }

  @override
  void onInit() {
    super.onInit();
    initializeVideo(0);
  }

  @override
  void onClose() {
    videoController.value?.dispose();
    pageController.dispose();
    super.onClose();
  }
}