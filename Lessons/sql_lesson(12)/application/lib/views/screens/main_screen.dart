import 'package:application/services/local_database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final localDatabase = LocalDatabase();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    final db = localDatabase.database;
  }

  void addNote() async {
    setState(() {
      isLoading = true;
    });
    await localDatabase.addNote("Ertaga o'qishim kerak, majburman🥲");
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Screen"),
        actions: [IconButton(onPressed: addNote, icon: Icon(Icons.add))],
      ),
      body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : const Text("Notes")),
    );
  }
}