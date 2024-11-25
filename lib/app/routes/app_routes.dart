import 'package:dating_app/app/modules/dashbaord/dashboard_binding.dart';
import 'package:dating_app/app/modules/dashbaord/dashboard_view.dart';
import 'package:dating_app/app/modules/onboarding/onboarding_binding.dart';
import 'package:dating_app/app/modules/onboarding/onboarding_view.dart';
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
  ];
}
