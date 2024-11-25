import 'package:dating_app/app/modules/chat_home/chat_home_controller.dart';
import 'package:get/get.dart';

class ChatHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ChatHomeController>(() => ChatHomeController());
  }
}