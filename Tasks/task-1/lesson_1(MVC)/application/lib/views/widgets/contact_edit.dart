import 'package:application/controllers/contacts_controller.dart';
import 'package:flutter/material.dart';

class ContactEdit extends StatefulWidget {
  final int index;
  const ContactEdit({required this.index, super.key});

  @override
  State<ContactEdit> createState() => _ContactEditState();
}

class _ContactEditState extends State<ContactEdit> {

  final _formKey = GlobalKey<FormState>();
  final ContactsController _contactsController = ContactsController();

  String editedName = "";

  String editedPhone = "";

  void _edit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _contactsController
            .edit(widget.index, {'name': editedName, 'phone': editedName});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add contact"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter your name';
                }
                return null;
              },
              onSaved: (newValue) {
                editedName = newValue ?? "";
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.add),
                border: OutlineInputBorder(),
                labelText: 'Phone number',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter your name';
                } else if (!RegExp(r"^\d+$").hasMatch(value)) {
                  return 'please modify you number as corrected';
                }
                return null;
              },
              onSaved: (newValue) {
                editedPhone = newValue ?? "";
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        ElevatedButton(
            onPressed: () {
              _edit();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text("Add"))
      ],
    );
  }
}
