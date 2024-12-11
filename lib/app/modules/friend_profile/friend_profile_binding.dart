import 'package:dating_app/app/modules/friend_profile/friend_profile_controller.dart';
import 'package:get/get.dart';

class FriendProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FriendProfileController>(() => FriendProfileController(),);
  }
}