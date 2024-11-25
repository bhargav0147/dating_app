
import 'package:dating_app/app/modules/home/card_swiper_widget.dart';
import 'package:dating_app/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

import '../../theme/colors.dart';
import '../../utils/snackbars.dart';
import '../../widgets/iconButtonWithBackground.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Obx(
      () => Stack(
        children: [
          Center(
            child: SizedBox(
              height: 550,
              child: CardSwiper(
                cardsCount: controller.cards.length,
                allowedSwipeDirection:
                    const AllowedSwipeDirection.symmetric(vertical: true),
                backCardOffset: const Offset(0, 0),
                controller: CardSwiperController(),
                onSwipe: (previousIndex, currentIndex, direction) {
                  if (direction == CardSwiperDirection.top) {
                    SnackbarUtils.showSuccess('Friend Request Send');
                    return true;
                  } else {
                    SnackbarUtils.showError('Blocked');
                    return true;
                  }
                },
                cardBuilder: (context, index, horizontalOffsetPercentage,
                    verticalOffsetPercentage) {
                  return CardSwiperCard(
                      imageUrl: controller.cards[index]['image'].toString(),
                      name: controller.cards[index]['name'].toString(),
                      age: int.parse('${controller.cards[index]['age']}'),
                      city: '${controller.cards[index]['city']}',
                      km: double.parse("${controller.cards[index]['km']}"));
                },
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.9),
            child: SizedBox(
              height: 70,
              width: double.maxFinite,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButtonWithBackground(
                      height: 40,
                      width: 40,
                      bgColor: AppColors.white,
                      icon: Icons.keyboard_return,
                      iconColor: AppColors.yellow,
                      iconSize: 20,
                      onClick: () {
                        SnackbarUtils.showSuccess('You Press Return Button');
                      },
                    ),
                    IconButtonWithBackground(
                      height: 50,
                      width: 50,
                      bgColor: AppColors.white,
                      icon: Icons.close,
                      iconColor: AppColors.red,
                      iconSize: 30,
                      onClick: () {
                        SnackbarUtils.showSuccess('You Press Close Button');
                      },
                    ),
                    IconButtonWithBackground(
                      height: 60,
                      width: 60,
                      bgColor: AppColors.white,
                      icon: Icons.favorite,
                      iconColor: AppColors.primary,
                      iconSize: 40,
                      onClick: () {
                        SnackbarUtils.showSuccess('You Press Like Button');
                      },
                    ),
                    IconButtonWithBackground(
                      height: 50,
                      width: 50,
                      bgColor: AppColors.white,
                      icon: Icons.star,
                      iconColor: AppColors.purple,
                      iconSize: 30,
                      onClick: () {
                        SnackbarUtils.showSuccess('You Press Star Button');
                      },
                    ),
                    IconButtonWithBackground(
                      height: 40,
                      width: 40,
                      bgColor: AppColors.white,
                      icon: Icons.bolt,
                      iconColor: AppColors.purple,
                      iconSize: 20,
                      onClick: () {
                        SnackbarUtils.showSuccess('You Press Bolt Button');
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
