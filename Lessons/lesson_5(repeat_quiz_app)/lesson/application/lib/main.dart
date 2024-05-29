import 'package:application/controllers/settings_controller.dart';
import 'package:application/notifiers/settings_notifier.dart';
import 'package:application/views/screens/home_screen.dart';
import 'package:application/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsNotifier(
        key: key,
        child: Builder(builder: (context) {
          return ListenableBuilder(
              listenable: SettingsNotifier.of(context),
              builder: ((context, child) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    darkTheme: ThemeData.dark(),
                    themeMode: SettingsNotifier.of(context).settings.themeMode,
                    home: HomeScreen(),
                  )));
        }),
        settingsController: SettingsController());
  }
}
