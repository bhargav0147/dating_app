import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/app/modules/home/home_controller.dart';
import 'package:dating_app/app/theme/colors.dart';
import 'package:dating_app/app/theme/fonts.dart';
import 'package:dating_app/app/widgets/custom_icon.dart';
import 'package:dating_app/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

import '../../utils/snackbars.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Obx(
      () => CardSwiper(
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
          return false;
         }
        },
        cardBuilder: (context, index, horizontalOffsetPercentage,
            verticalOffsetPercentage) {
          return Center(
            child: Container(
              height: 500,
              width: 300,
              decoration: const BoxDecoration(
                color: AppColors.fullWhite,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Stack(
                children: [
                  Center(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: controller.cards[index]['image'].toString(),
                      height: 500,
                      width: 300,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 120,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(50)),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.primary.withOpacity(0.5),
                              AppColors.primary.withOpacity(0.4),
                              AppColors.primary.withOpacity(0.3),
                              AppColors.primary.withOpacity(0.2),
                              AppColors.primary.withOpacity(0.1),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text:
                                  "${controller.cards[index]['name']}, ${controller.cards[index]['age']}",
                              style: AppFonts.large,
                              color: AppColors.fullWhite,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              text:
                                  "Live in ${controller.cards[index]['city']}",
                              style: AppFonts.medium,
                              color: AppColors.fullWhite,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.greySwatch.withOpacity(0.7)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CustomIcon(
                              icon: Icons.location_on_rounded,
                              color: AppColors.fullWhite,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: '${controller.cards[index]['km']} KM',
                              color: AppColors.fullWhite,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
