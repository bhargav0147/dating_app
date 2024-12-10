import 'package:dating_app/app/modules/chat_home/chat_home_view.dart';
import 'package:dating_app/app/modules/dashbaord/dashboard_controller.dart';
import 'package:dating_app/app/modules/home/home_view.dart';
import 'package:dating_app/app/modules/profile/profile_view.dart';
import 'package:dating_app/app/modules/show_post/show_post_view.dart';
import 'package:dating_app/app/theme/colors.dart';
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
      const ChatHomeView(),
      const ChatHomeView(),
      const ProfileView()
    ];


    return Scaffold(
      body: Obx(() => pages[dashboardController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,

          onDestinationSelected: dashboardController.changeIndex,
          selectedIndex: dashboardController.selectedIndex.value,
          backgroundColor: AppColors.white,
          indicatorColor: AppColors.primary,

          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home_filled,color: AppColors.white,),
              icon: Icon(Icons.home_filled,color: AppColors.grey,),
              label: 'Home',
            ),NavigationDestination(
              selectedIcon: Icon(Icons.image,color: AppColors.white,),
              icon: Icon(Icons.image,color: AppColors.grey,),
              label: 'Post',
            ),NavigationDestination(
              selectedIcon: Icon(Icons.add_circle_outline_sharp,color: AppColors.white,),
              icon: Icon(Icons.add_circle_outline_sharp,color: AppColors.grey,),
              label: 'Add Post',
            ),NavigationDestination(
              selectedIcon: Icon(Icons.video_camera_back_outlined,color: AppColors.white,),
              icon: Icon(Icons.video_camera_back_outlined,color: AppColors.grey,),
              label: 'Flare',
            ),NavigationDestination(
              selectedIcon: Icon(Icons.person,color: AppColors.white,),
              icon: Icon(Icons.person,color: AppColors.grey,),
              label: 'Profile',
            ),
          ],
        )
      ),
    );
  }
}
