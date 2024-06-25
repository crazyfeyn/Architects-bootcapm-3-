import 'package:flutter/material.dart';
import 'package:goora/repositories/settings_controller.dart';
import 'package:goora/utils/notifier/settings_notifier.dart';
import 'package:goora/views/screens/home_screen.dart';

void main() {
  final settingsController = SettingsController();

  runApp(
    SettingsNotifier(
      notifier: settingsController,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
