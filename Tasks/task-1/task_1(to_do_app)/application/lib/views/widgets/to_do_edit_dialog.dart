import 'package:flutter/material.dart';

class ToDoEditDialog extends StatefulWidget {
  final String name;
  final String time;
  ToDoEditDialog({required this.name, required this.time, super.key});

  @override
  State<ToDoEditDialog> createState() => _ToDoEditDialogState();
}

class _ToDoEditDialogState extends State<ToDoEditDialog> {
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
              initialValue: widget.name,
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
              initialValue: widget.time,
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
