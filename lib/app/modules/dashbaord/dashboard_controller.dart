import 'package:get/get.dart';

class DashboardController extends GetxController
{
  var selectedIndex = 2.obs;

  chnageIndex(int index){
    selectedIndex.value = index;
  }
}