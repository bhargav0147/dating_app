import 'package:dating_app/app/modules/change_password/change_password_binding.dart';
import 'package:dating_app/app/modules/change_password/change_password_view.dart';
import 'package:dating_app/app/modules/chat_home/chat_home_binding.dart';
import 'package:dating_app/app/modules/chat_home/chat_home_view.dart';
import 'package:dating_app/app/modules/contacts/contact_view.dart';
import 'package:dating_app/app/modules/contacts/contacts_binding.dart';
import 'package:dating_app/app/modules/dashbaord/dashboard_binding.dart';
import 'package:dating_app/app/modules/dashbaord/dashboard_view.dart';
import 'package:dating_app/app/modules/editProfile/editProfile_binding.dart';
import 'package:dating_app/app/modules/editProfile/editProfile_view.dart';
import 'package:dating_app/app/modules/friend_profile/friend_profile_binding.dart';
import 'package:dating_app/app/modules/friend_profile/friend_profile_view.dart';
import 'package:dating_app/app/modules/gender/gender_binding.dart';
import 'package:dating_app/app/modules/gender/gender_view.dart';
import 'package:dating_app/app/modules/multiple_Images/multiple_Images_binding.dart';
import 'package:dating_app/app/modules/multiple_Images/multiple_images_view.dart';
import 'package:dating_app/app/modules/settings/settings_binding.dart';
import 'package:dating_app/app/modules/settings/settings_view.dart';
import 'package:dating_app/app/modules/signup/signup_binding.dart';
import 'package:dating_app/app/modules/signup/signup_view.dart';
import 'package:dating_app/app/modules/onboarding/onboarding_binding.dart';
import 'package:dating_app/app/modules/onboarding/onboarding_view.dart';
import 'package:dating_app/app/modules/otp/otp_binding.dart';
import 'package:dating_app/app/modules/otp/otp_view.dart';
import 'package:dating_app/app/modules/welcome/welcome_binding.dart';
import 'package:dating_app/app/modules/welcome/welcome_view.dart';
import 'package:dating_app/app/modules/yourInterests/your_interests_binding.dart';
import 'package:dating_app/app/modules/yourInterests/your_interests_view.dart';
import 'package:dating_app/app/modules/yourPreference/yourPreference_binding.dart';
import 'package:dating_app/app/modules/yourPreference/yourPreference_view.dart';
import 'package:get/get.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String dashbaord = '/dashboard';
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome';
  static const String signup = '/signup';
  static const String otp = '/otp';
  static const String editProfile = '/editProfile';
  static const String gender = '/gender';
  static const String yourInterests = '/yourInterests';
  static const String contacts = '/contacts';
  static const String yourPreference = '/yourPreference';
  static const String settings = '/settings';
  static const String chat = '/chat';
  static const String chatMainView = '/chatMainView';
  static const String friendProfile = '/friendProfile';
  static const String changePassword = '/changePassword';
  static const String multipleImages = '/multipleImages';

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
        name: signup,
        page: () => const SignupView(),
        binding: MymobileBinding()),
    GetPage(name: otp, page: () => const OtpView(), binding: OtpBinding()),
    GetPage(
        name: editProfile,
        page: () => const EditprofileView(),
        binding: EditprofileBinding()),
    GetPage(
        name: gender, page: () => const GenderView(), binding: GenderBinding()),
    GetPage(
        name: yourInterests,
        page: () => const YourInterestsView(),
        binding: YourInterestsBinding()),
    GetPage(
        name: contacts,
        page: () => const ContactView(),
        binding: ContactsBinding()),
    GetPage(
        name: yourPreference,
        page: () => const YourpreferenceView(),
        binding: YourpreferenceBinsing()),
    GetPage(
        name: settings,
        page: () => const SettingsView(),
        binding: SettingsBinding()),
    GetPage(
        name: chat,
        page: () => const ChatHomeView(),
        binding: ChatHomeBinding()),
    GetPage(
        name: friendProfile,
        page: () => const FriendProfileView(),
        binding: FriendProfileBinding()),
    GetPage(
        name: changePassword,
        page: () => const ChangePasswordView(),
        binding: ChangePasswordBinding()),
    GetPage(
        name: multipleImages,
        page: () => const MultipleImagesView(),
        binding: MultipleImagesBinding()),
    // GetPage(
    //     name: chatMainView,
    //     page: () => const ChatMainView(),
    //     binding: ChatMainViewBinding()),
  ];
}
