import 'package:dating_app/app/modules/home/card_swiper_widget.dart';
import 'package:dating_app/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../../utils/snackbars.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/iconButtonWithBackground.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText(
          text: 'Discover',
          style: AppFonts.veryExtraLarge,
          color: AppColors.black,
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double height70 = constraints.maxHeight * 0.8;
          final double height30 = constraints.maxHeight * 0.2;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height70,
                child: Obx(() => CardSwiper(
                      padding: const EdgeInsets.only(
                          bottom: 0, top: 10, left: 15, right: 15),
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
                            imageUrl:
                                controller.cards[index]['image'].toString(),
                            name: controller.cards[index]['name'].toString(),
                            age: int.parse('${controller.cards[index]['age']}'),
                            city: '${controller.cards[index]['city']}',
                            km: double.parse(
                                "${controller.cards[index]['km']}"));
                      },
                    )),
              ),
              SizedBox(
                height: height30,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButtonWithBackground(
                        height: 50,
                        width: 50,
                        bgColor: AppColors.white,
                        icon: Icons.close,
                        iconColor: AppColors.yellow,
                        iconSize: 30,
                        onClick: () {
                          SnackbarUtils.showSuccess('You Press Close Button');
                        },
                      ),
                      IconButtonWithBackground(
                        height: 100,
                        width: 100,
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
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
