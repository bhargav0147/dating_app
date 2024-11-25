import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final pageIndex = 0.obs;

  final onboardingDetails = [
    {
      'image':
          'https://images.pexels.com/photos/1391498/pexels-photo-1391498.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'description': 'Find people who match with you.',
    },
    {
      'image':
          'https://images.pexels.com/photos/1391499/pexels-photo-1391499.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'description': 'Easily message & call the people you like',
    },
    {
      'image':
          'https://images.pexels.com/photos/921646/pexels-photo-921646.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'description': 'Dont wait anymore, find out your soul mate now',
    },
  ];

  void changePage(int index) {
    pageIndex.value = index;
  }
}
