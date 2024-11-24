import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  void loginUser(String username, String password) {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }
}
