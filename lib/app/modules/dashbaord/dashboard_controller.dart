import 'package:get/get.dart';

class DashboardController extends GetxController
{
  var selectedIndex = 1.obs;

  chnageIndex(int index){
    selectedIndex.value = index;
  }
}