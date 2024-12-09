// ignore_for_file: prefer_const_constructors

import 'package:dating_app/app/modules/chat_home/chat_home_view.dart';
import 'package:dating_app/app/modules/dashbaord/dashboard_controller.dart';
import 'package:dating_app/app/modules/home/home_view.dart';
import 'package:dating_app/app/modules/profile/profile_view.dart';
import 'package:dating_app/app/modules/reels/reels_view.dart';
import 'package:dating_app/app/modules/show_post/show_post_view.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());

    final List<Widget> pages = [
      const HomeView(),
      const ShowPostView(),
      const ReelsView(),
      const ProfileView()
    ];

    return Scaffold(
      body: Obx(() => pages[dashboardController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: CustomIcon(
                icon: Icons.home,
                size: 30,
                color: dashboardController.selectedIndex.value == 0
                    ? AppColors.primary
                    : AppColors.grey.shade400,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: CustomIcon(
                icon: Icons.photo_library,
                size: 30,
                color: dashboardController.selectedIndex.value == 1
                    ? AppColors.primary
                    : AppColors.grey.shade400,
              ),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: CustomIcon(
                icon: Icons.video_collection_outlined,
                size: 30,
                color: dashboardController.selectedIndex.value == 2
                    ? AppColors.primary
                    : AppColors.grey.shade400,
              ),
              label: 'Reels',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: CustomIcon(
                icon: Icons.person,
                size: 30,
                color: dashboardController.selectedIndex.value == 3
                    ? AppColors.primary
                    : AppColors.grey.shade400,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: dashboardController.selectedIndex.value,
          onTap: dashboardController.changeIndex,
        ),
      ),
    );
  }
}
