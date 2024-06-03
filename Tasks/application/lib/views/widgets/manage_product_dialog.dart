import 'package:application/models/todo.dart';
import 'package:flutter/material.dart';

class ManagaTodoDialog extends StatefulWidget {
  final ToDo? todo;
  const ManagaTodoDialog({super.key, this.todo});

  @override
  State<ManagaTodoDialog> createState() => _ManagaTodoDialogState();
}

class _ManagaTodoDialogState extends State<ManagaTodoDialog> {
  final formKey = GlobalKey<FormState>();
  String title = "";
  String description = "";
  String date = "";
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      title = widget.todo!.title;
      description = widget.todo!.description;
      date = widget.todo!.date;
      isCompleted = widget.todo!.isCompleted;
    }
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Navigator.pop(context, {
        'title': title,
        'description': description,
        'date': date,
        'isCompleted': isCompleted
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(widget.todo != null ? 'edit todo' : 'Add todo'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: title,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "name of todo",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please enter todo's name";
                }

                return null;
              },
              onSaved: (newValue) {
                title = newValue!;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: description,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "desctiption of todo",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please enter todo's description";
                }
                return null;
              },
              onSaved: (newValue) {
                description = newValue!;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: date,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "date of todo",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please enter todo's date";
                }
                return null;
              },
              onSaved: (newValue) {
                date = newValue!;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: isCompleted.toString(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "status of todo",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please enter todo's status (true or false)";
                }
                return null;
              },
              onSaved: (newValue) {
                isCompleted = newValue == 'true' ? true : false;
              },
            ),const SizedBox(height: 10),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        FilledButton(
          onPressed: submit,
          child: const Text("Save"),
        ),
      ],
    );
  }
}
