import 'dart:async';

import 'package:application/controllers/contact_database_controller.dart';
import 'package:flutter/material.dart';

class ContactInfoScreen extends StatefulWidget {
  Function refresh;
  final Map<String, dynamic> contact;
  ContactInfoScreen({super.key, required this.contact, required this.refresh});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _contactNameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final ContactDatabaseController _contactDatabaseController =
      ContactDatabaseController();
  Map<String, dynamic> oldContact = {};

  @override
  void initState() {
    super.initState();
    _contactNameController.text = widget.contact['contact_name'];
    _contactNumberController.text = widget.contact['contact_number'];
    oldContact = {
      'contact_name': widget.contact['contact_name'],
      'contact_number': widget.contact['contact_number']
    };
    setState(() {});
  }

  @override
  void dispose() {
    _contactNameController.dispose();
    _contactNumberController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Map<String, dynamic> updatedContact = {
        'contact_name': _contactNameController.text,
        'contact_number': _contactNumberController.text
      };
      await _contactDatabaseController.updateContact(
          updatedContact, oldContact);
      widget.refresh();
      setState(() {});
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Contact',
          style: TextStyle(
              color: Color.fromARGB(255, 253, 207, 207),
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(
                  Icons.person,
                  size: 180,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _contactNumberController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter number',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _contactNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter name',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: _submitForm,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Change',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
