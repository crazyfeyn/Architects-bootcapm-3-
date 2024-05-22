import 'package:application/models/contact.dart';
import 'package:application/views/widgets/contact_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onDelete;
  final int index;

  const ContactItem(
    this.contact, {
    super.key,
    required this.onDelete,
    required this.index,
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
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (ctx) {
                      return ContactEdit(index: index);
                    });
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
