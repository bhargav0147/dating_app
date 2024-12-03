import 'package:get/get.dart';

class ProfileController extends GetxController{
  RxInt tabBarIndex = 0.obs;

  void chnageTabbarIndex(value){
    tabBarIndex.value = value;
  }
}