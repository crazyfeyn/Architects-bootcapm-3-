import 'package:flutter/material.dart';

class EditContact extends StatefulWidget {
  const EditContact({super.key});

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  final _formKey = GlobalKey<FormState>();
  late String editedName = "";
  late String editedTime = "";

  void _editNow() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(
          context, {'editedName': editedName, 'editedTime': editedTime});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a new task'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'New to do task name',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter your to do task please';
                }
                return null;
              },
              onSaved: (newValue) {
                editedName = newValue ?? "";
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'New time to do it',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter your to do time please';
                }
                return null;
              },
              onSaved: (newValue) {
                editedTime = newValue ?? "";
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
              _editNow();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text("Add"))
      ],
    );
  }
}
