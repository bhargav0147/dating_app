import 'package:dating_app/app/assets/image_config.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final pageIndex = 0.obs;

  final onboardingDetails = [
    {
      'image':AppImages.onboardingOne,
      'description':
          'Users going through a vetting process to ensure you never match with bots.',
      'title': 'Algorithm'
    },
    {
      'image':
      AppImages.onboardingTwo,
      'description':
          'We match you with people that have alarge array of similar interests.',
      'title': 'Matches'
    },
    {
      'image':
      AppImages.onboardingThree,
      'description':
          'Sign up today and enjoy the first month of premium benefits on us.',
      'title': 'Premium '
    },
  ];
}
