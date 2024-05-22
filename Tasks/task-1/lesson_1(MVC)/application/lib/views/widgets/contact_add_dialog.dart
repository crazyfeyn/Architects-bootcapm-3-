import 'package:flutter/material.dart';

class ContactAddDialog extends StatefulWidget {
  ContactAddDialog({super.key});

  @override
  State<ContactAddDialog> createState() => _ContactAddDialogState();
}

class _ContactAddDialogState extends State<ContactAddDialog> {
  final _formKey = GlobalKey<FormState>();

  String name = "";

  String phone = "";

  void _add() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.pop(context, {'name': name, 'phone': phone});
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
                name = newValue ?? "";
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
                phone = newValue ?? "";
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
              _add();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text("Add"))
      ],
    );
  }
}
