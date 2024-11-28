import 'package:dating_app/app/modules/dashbaord/dashboard_binding.dart';
import 'package:dating_app/app/modules/dashbaord/dashboard_view.dart';
import 'package:dating_app/app/modules/editProfile/editProfile_binding.dart';
import 'package:dating_app/app/modules/editProfile/editProfile_view.dart';
import 'package:dating_app/app/modules/gender/gender_binding.dart';
import 'package:dating_app/app/modules/gender/gender_view.dart';
import 'package:dating_app/app/modules/myMobile/myMobile_binding.dart';
import 'package:dating_app/app/modules/myMobile/myMobile_view.dart';
import 'package:dating_app/app/modules/onboarding/onboarding_binding.dart';
import 'package:dating_app/app/modules/onboarding/onboarding_view.dart';
import 'package:dating_app/app/modules/otp/otp_binding.dart';
import 'package:dating_app/app/modules/otp/otp_view.dart';
import 'package:dating_app/app/modules/welcome/welcome_binding.dart';
import 'package:dating_app/app/modules/welcome/welcome_view.dart';
import 'package:get/get.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String dashbaord = '/dashbaord';
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome';
  static const String myMobile = '/myMobile';
  static const String otp = '/otp';
  static const String editProfile = '/editProfile';
  static const String gender = '/gender';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: dashbaord,
        page: () => const DashboardView(),
        binding: DashboardBinding()),
    GetPage(
        name: onboarding,
        page: () => OnboardingView(),
        binding: OnboardingBinding()),
    GetPage(
        name: welcome,
        page: () => const WelcomeView(),
        binding: WelcomeBinding()),
    GetPage(
        name: myMobile,
        page: () => const MymobileView(),
        binding: MymobileBinding()),
    GetPage(name: otp, page: () => const OtpView(), binding: OtpBinding()),
    GetPage(
        name: editProfile,
        page: () => const EditprofileView(),
        binding: EditprofileBinding()),
    GetPage(
        name: gender, page: () => const GenderView(), binding: GenderBinding()),
  ];
}
