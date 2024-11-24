import 'package:get/get.dart'; // Import your routes file

class NavigationUtils {
  static void navigateTo(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  static void navigateBack() {
    Get.back();
  }

  static void replaceWith(String route, {dynamic arguments}) {
    Get.offNamed(route, arguments: arguments);
  }
}
