import 'package:application/models/settings.dart';
import 'package:application/utils/settings_notifier.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String curLocation = 'tashkant';
  Future<void> saveChanges() async {}

  Future<void> getChanges() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF1D2547),
              Color(0xFF1D2547),
              Color(0xFF805BCA),
              Color.fromARGB(255, 245, 203, 253),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              curLocation,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
      )),
    );
  }
}
