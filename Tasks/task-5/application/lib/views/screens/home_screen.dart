import 'package:application/notifiers/settings_notifier.dart';
import 'package:application/views/screens/note_screen.dart';
import 'package:application/views/screens/todo_screen.dart';
import 'package:application/views/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final setting = SettingsNotifier.of(context).settings;
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('dark mode'),
              value: setting.themeMode == ThemeMode.dark,
              onChanged: (value) {
                SettingsNotifier.of(context).toggleSwitch(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
