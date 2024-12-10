import 'package:dating_app/app/modules/home/card_swiper_widget.dart';
import 'package:dating_app/app/modules/home/home_controller.dart';
import 'package:dating_app/app/utils/sized_box_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

import '../../config/app_variables.dart';
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
        body: Padding(
          padding: const EdgeInsets.only(
            bottom: AppVariables.APPBOTTOMSPACING,
            top: AppVariables.APPTOPSPACING,
            left: AppVariables.APPSIDESPACING,
            right: AppVariables.APPSIDESPACING,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBoxHelper.h10,
              Flexible(
                child: Obx(() => CardSwiper(
                      cardsCount: controller.cards.length,
                      allowedSwipeDirection:
                          const AllowedSwipeDirection.symmetric(vertical: true),
                      backCardOffset: const Offset(0, 0),
                      controller: CardSwiperController(),
                      padding: const EdgeInsets.all(0),
                      onSwipe: (previousIndex, currentIndex, direction) {
                        if (direction == CardSwiperDirection.top) {
                          SnackbarUtils.showSuccess(context,'Friend Request Send');
                          return true;
                        } else {
                          SnackbarUtils.showError(context,'Blocked');
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
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 100,
                  child: IntrinsicHeight(
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
                            SnackbarUtils.showSuccess(context,'You Press Close Button');
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
                            SnackbarUtils.showSuccess(context,'You Press Like Button');
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
                            SnackbarUtils.showSuccess(context,'You Press Star Button');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
