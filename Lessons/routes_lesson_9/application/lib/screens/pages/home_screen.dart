import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('enter your name'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                  Navigator.pushNamed(context, '/second', arguments: nameController.text);
                  nameController.clear();
              },
              child: const Text('Go to second page')),
        ],
      )),
    );
  }
}
