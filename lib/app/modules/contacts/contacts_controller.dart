import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsController extends GetxController {
  RxList contactsList = [].obs;

  Future<int> getContactFromUser() async {
    PermissionStatus permissionStatus = await Permission.contacts.request();

    if (permissionStatus.isGranted) {
      try {
        List<Contact> contacts = await FlutterContacts.getContacts(
          withProperties: true,
        );
        contactsList.value = contacts;
        return contacts.length;
      } catch (e) {
        return 0;
      }
    } else {
      return 0;
    }
  }
}
