import 'dart:async';

import 'package:application/controllers/contact_database_controller.dart';
import 'package:application/vews/screens/contact_info_screen.dart';
import 'package:application/vews/widgets/add_dialog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ContactDatabaseController contactDatabaseController =
      ContactDatabaseController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    void refresh() {
      setState(() {
        isLoading = true;
      });
      setState(() {});
      setState(() {
        isLoading = false;
      });
    }

    Future<void> deleteContact(contact) async {
      contactDatabaseController.deleteContact(contact);
      refresh();
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 166, 58),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 55, 166, 58),
        title: const Text(
          'Contacts',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AddDialog(refresh: refresh);
                    });
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
              future: contactDatabaseController.getContacts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('Contacts unvaliable'),
                  );
                }
                final List<Map<String, dynamic>> contacts = snapshot.data!;
                return ListView.builder(
                    itemExtent: 80,
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ContactInfoScreen(
                                          contact: contacts[index],
                                          refresh: refresh,
                                        )));
                          },
                          child: ListTile(
                            title: Text(contacts[index]['contact_name']),
                            subtitle: Text(contacts[index]['contact_number']),
                            leading: const CircleAvatar(
                              child: Center(
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                ),
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () => deleteContact(contacts[index]),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ),
                        ),
                      );
                    });
              })),
    );
  }
}
