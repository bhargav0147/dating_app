// ignore_for_file: prefer_const_constructors

import 'package:dating_app/app/modules/chat_home/chat_home_view.dart';
import 'package:dating_app/app/modules/dashbaord/dashboard_controller.dart';
import 'package:dating_app/app/modules/home/home_view.dart';
import 'package:dating_app/app/modules/profile/profile_view.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/sized_box_helper.dart';
import '../../utils/snackbars.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());

    final List<Widget> pages = [
      const HomeView(),
      const HomeView(),
      const ChatHomeView(),
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
              icon: CustomIcon(
                icon: Icons.home,
                size: 30,
                color: dashboardController.selectedIndex.value == 1
                    ? AppColors.primary
                    : AppColors.grey.shade400,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                icon: Icons.chat,
                size: 30,
                color: dashboardController.selectedIndex.value == 2
                    ? AppColors.primary
                    : AppColors.grey.shade400,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
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
          onTap: dashboardController.chnageIndex,
        ),
      ),
    );
  }
}
