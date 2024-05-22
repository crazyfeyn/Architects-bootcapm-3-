import 'package:application/controllers/contacts_controller.dart';
import 'package:application/views/widgets/contact_add_dialog.dart';
import 'package:application/views/widgets/contact_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final ContactsController _contactsController = ContactsController();

  void delete(int index) {
    _contactsController.delete(index);
    setState(() {});
  }

  Map<String, String>? data;

  // void edit(int index) {
  //   _contactsController.edit(index);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact screen',
        ),
        actions: [
          IconButton(
              onPressed: () async {
                Map<String, String>? data = await showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: ((context) {
                      return ContactAddDialog();
                    }));
                if (data != null) {
                  _contactsController.add(data['name']!, data['phone']!);
                }
                setState(() {});
              },
              icon: const Icon(CupertinoIcons.plus))
        ],
      ),
      body: ListView.builder(
          itemCount: _contactsController.list.length,
          itemBuilder: (ctx, index) {
            return ContactItem(_contactsController.list[index],
                onDelete: () => delete(index), index: index,);
          }),
    );
  }
}
