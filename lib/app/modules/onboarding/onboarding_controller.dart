import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final pageIndex = 0.obs;

  final onboardingDetails = [
    {
      'image':
          'https://images.pexels.com/photos/1391498/pexels-photo-1391498.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'description':
          'Users going through a vetting process to ensure you never match with bots.',
      'title': 'Algorithm'
    },
    {
      'image':
          'https://images.pexels.com/photos/1391499/pexels-photo-1391499.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'description':
          'We match you with people that have alarge array of similar interests.',
      'title': 'Matches'
    },
    {
      'image':
          'https://images.pexels.com/photos/921646/pexels-photo-921646.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'description':
          'Sign up today and enjoy the first month of premium benefits on us.',
      'title': 'Premium '
    },
  ];
}
