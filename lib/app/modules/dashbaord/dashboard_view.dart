// ignore_for_file: prefer_const_constructors

import 'package:dating_app/app/modules/dashbaord/dashboard_controller.dart';
import 'package:dating_app/app/modules/home/home_view.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      const HomeView(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Dating App',
          style: AppFonts.large,
          color: AppColors.black,
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              SnackbarUtils.showSuccess('You Press Logo');
            },
            child: CustomIcon(
              icon: Icons.favorite,
              color: AppColors.primary,
              size: 30,
            )),
        actions: [
          InkWell(
              onTap: () {
                SnackbarUtils.showSuccess('You Press Notification Button');
              },
              child: CustomIcon(
                icon: Icons.notification_add,
                color: AppColors.primary,
                size: 30,
              )),
          SizedBox(
            width: 15,
          )
        ],
      ),
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
                icon: Icons.home,
                size: 30,
                color: dashboardController.selectedIndex.value == 2
                    ? AppColors.primary
                    : AppColors.grey.shade400,
              ),
              label: 'Home',
            ),
          ],
          currentIndex: dashboardController.selectedIndex.value,
          onTap: dashboardController.chnageIndex,
        ),
      ),
    );
  }
}
