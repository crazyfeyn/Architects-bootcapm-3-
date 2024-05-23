import 'package:application/models/contact.dart';
import 'package:application/views/widgets/contact_edit.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onDelete;
  final int index;
  final Function editToDo;


  const ContactItem(
    this.contact, {
    super.key,
    required this.onDelete,
    required this.index,
    required this.editToDo
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: contact.color,
      ),
      title: Text(
        contact.name,
      ),
      subtitle: Text(contact.phone),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                IconButton(
        onPressed: () async {
          Map<String, String>? data = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) {
                return const EditContact();
              });
          if (data != null) {
            editToDo(index, data);
          }
        },
        icon: const Icon(Icons.edit),
        color: Colors.blue
      );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              )),
          IconButton(
              onPressed: () {
                onDelete();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}
