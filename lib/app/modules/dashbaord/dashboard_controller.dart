import 'package:get/get.dart';

class DashboardController extends GetxController
{
  var selectedIndex = 3.obs;

  chnageIndex(int index){
    selectedIndex.value = index;
  }
}