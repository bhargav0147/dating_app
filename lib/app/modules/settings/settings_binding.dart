import 'package:dating_app/app/modules/settings/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}