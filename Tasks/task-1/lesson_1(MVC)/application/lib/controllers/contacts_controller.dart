import 'dart:math';

import 'package:application/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsController {
  final List<Contact> _list = [
    Contact(name: 'Tom', phone: '+998 91 777 77 77', color: Colors.red),
    Contact(name: 'Jerry', phone: '+998 91 999 99 99', color: Colors.yellow),
    Contact(name: 'Spike', phone: '+998 91 888 88 88', color: Colors.blue),
  ];

  List<Contact> get list {
    return [..._list];
  }

  void delete(int index) {
    _list.removeAt(index);
  }

   void editToDo(int index, Map<String, String> data) {
    list[index].name = data['editedName']!;
    list[index].phone = data['editedPhone']!;
  }

  void add(String name, String phone) {
    int red = Random().nextInt(255);
    int blue = Random().nextInt(255);
    int green = Random().nextInt(255);
    _list.add(Contact(
        name: name,
        phone: phone,
        color: Color.fromARGB(255, red, green, blue)));
  }
}
