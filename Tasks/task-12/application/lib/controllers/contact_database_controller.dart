import 'package:application/services/contact_local_database.dart';

class ContactDatabaseController {
  ContactLocalDatabase contactLocalDatabase = ContactLocalDatabase();

  Future<void> addContact(String contactName, String contactNumber) async {
    await contactLocalDatabase.addContact(contactName, contactNumber);
  }

  Future<List<Map<String, dynamic>>> get getContacts =>
      contactLocalDatabase.getContacts();

  Future<void> deleteContact(Map<String, dynamic> contact) async{
    contactLocalDatabase.deleteContact(contact);
  }

  Future<void> updateContact(Map<String, dynamic> contact, Map<String, dynamic> oldContact) async{
    contactLocalDatabase.updateContact(contact, oldContact);
  }
}
