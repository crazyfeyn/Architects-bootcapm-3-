import 'package:flutter/material.dart';

class Dropdown {
  static void showDropDown(
      BuildContext context, int currentIndex, Function switchMenu) {
    final List<String> options = ['Products', 'Categories', 'Users'];
    showMenu(
            context: context,
            position: const RelativeRect.fromLTRB(50, 110, 0, 0),
            items: options.map((String option) {
              return PopupMenuItem(
                value: option,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    option,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              );
            }).toList())
        .then((value) {
      if (value != options[currentIndex]) {
        switchMenu(options.indexOf(value!));
      }
    });
  }
}
