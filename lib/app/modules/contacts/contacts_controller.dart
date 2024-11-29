import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController {
  RxList contactsList = [].obs;

  Future<int> getContactFromUser() async {
    try {
      if (await FlutterContacts.requestPermission()) {
        List<Contact> contacts = await FlutterContacts.getContacts();
        return contacts.length;
      } else {
        return 0;
      }
    } catch (e) {
      print('Error occurred while accessing contacts: $e');
      return 0;
    }
  }
}
