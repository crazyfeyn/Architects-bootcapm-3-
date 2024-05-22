import 'package:flutter/material.dart';

class ToDoAddDialog extends StatefulWidget {
  const ToDoAddDialog({super.key});

  @override
  State<ToDoAddDialog> createState() => _ToDoAddDialogState();
}

class _ToDoAddDialogState extends State<ToDoAddDialog> {
  final _formKey = GlobalKey<FormState>();

  late String name = "";
  late String time = "";

  void _add() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context, {'name': name, 'time': time});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a task'),
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
                  return 'please enter your to do task please';
                }
                return null;
              },
              onSaved: (newValue) {
                name = newValue ?? "";
              },
            ),
            const SizedBox(height: 10),

            //! TextButton(
            //!     onPressed: () {},
            //!     child: Column(
            //!       mainAxisAlignment: MainAxisAlignment.center,
            //!       crossAxisAlignment: CrossAxisAlignment.center,
            //!       children: [
            //!         Text("pick time to do it"),
            //!         SizedBox(height: 7),
            //!         Icon(CupertinoIcons.time)
            //!       ],
            //!     ))

            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Time to do it',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter your to do time please';
                }
                return null;
              },
              onSaved: (newValue) {
                time = newValue ?? "";
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
