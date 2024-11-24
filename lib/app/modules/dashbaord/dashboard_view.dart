import 'package:dating_app/app/modules/dashbaord/dashboard_controller.dart';
import 'package:dating_app/app/modules/home/home_view.dart';
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
      const HomeView(),
      const HomeView(),
    ];

    return Scaffold(
      body: Center(child: Obx(() => pages[dashboardController.selectedIndex.value])),
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
                    : AppColors.greySwatch.shade400,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                icon: Icons.home,
                 size: 30,
                color: dashboardController.selectedIndex.value == 1
                    ? AppColors.primary
                    : AppColors.greySwatch.shade400,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                icon: Icons.home,
                 size: 30,
                color: dashboardController.selectedIndex.value == 2
                    ? AppColors.primary
                    : AppColors.greySwatch.shade400,
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
