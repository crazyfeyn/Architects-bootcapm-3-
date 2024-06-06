import 'dart:async';

import 'package:application/controllers/contact_database_controller.dart';
import 'package:application/services/contact_local_database.dart';
import 'package:flutter/material.dart';

class AddDialog extends StatefulWidget {
  Function refresh;
  AddDialog({super.key, required this.refresh});

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController contactNameController = TextEditingController();
    TextEditingController contactNumberController = TextEditingController();
    ContactDatabaseController contactDatabaseController =
        ContactDatabaseController();

    Future<void> _submitForm() async {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        await contactDatabaseController.addContact(
            contactNameController.text, contactNumberController.text);

        var x = await contactDatabaseController.getContacts;
        contactNumberController.clear();
        contactNameController.clear();
        widget.refresh();
        setState(() {});

        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      }
    }

    return AlertDialog(
      title: const Text('Add contact'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: contactNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('enter number'),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'please enter number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: contactNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('enter name'),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'please enter name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () => _submitForm(),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Add'),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
