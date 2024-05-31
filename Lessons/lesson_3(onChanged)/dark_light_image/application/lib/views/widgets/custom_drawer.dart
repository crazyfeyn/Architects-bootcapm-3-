import 'package:application/utils/app_constants.dart';
import 'package:application/views/screens/home_screen.dart';
import 'package:application/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeModeChanged;
  final ValueChanged<String> onBackgroundChanged;
  final changeDrawerColor;
  final changeAppBarColor;
  final changeTextSize;
  const CustomDrawer({
    super.key,
    required this.onThemeModeChanged,
    required this.onBackgroundChanged,
    required this.changeAppBarColor,
    required this.changeDrawerColor,
    required this.changeTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppConstants.drawerColor,
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title:
                Text('Menu', style: TextStyle(fontSize: AppConstants.textSize)),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => HomeScreen(
                      onThemeModeChanged: onThemeModeChanged,
                      onBackgroundChanged: onBackgroundChanged,
                      changeAppBarColor: changeAppBarColor,
                      changeDrawerColor: changeDrawerColor,
                      changeTextSize: changeTextSize)));
            },
            leading: const Icon(Icons.home),
            title: Text("Main Screen",
                style: TextStyle(fontSize: AppConstants.textSize)),
            trailing: const Icon(
              Icons.chevron_right_rounded,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => SettingsScreen(
                        onThemeModeChanged: onThemeModeChanged,
                        onBackgroundChanged: onBackgroundChanged,
                        changeAppBarColor: changeAppBarColor,
                        changeDrawerColor: changeDrawerColor,
                        changeTextSize: changeTextSize
                      )));
            },
            leading: const Icon(Icons.settings),
            title: Text("Settings",
                style: TextStyle(fontSize: AppConstants.textSize)),
            trailing: const Icon(
              Icons.chevron_right_rounded,
            ),
          )
        ],
      ),
    );
  }
}
