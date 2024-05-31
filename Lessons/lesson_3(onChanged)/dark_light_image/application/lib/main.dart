import 'dart:convert';

import 'package:application/utils/app_constants.dart';
import 'package:application/views/screens/password_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List colors = [Colors.yellow, Colors.amber, Colors.blue, Colors.purple];

  @override
  void initState() {
    super.initState();
    saveString();
    getString();
  }

  Future<void> saveString() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("themeMode", AppConstants.themeMode);
    await sharedPreferences.setInt('appbarIndex', AppConstants.i);
    await sharedPreferences.setInt('drawerIndex', AppConstants.k);
    await sharedPreferences.setDouble('textSize', AppConstants.textSize);
  }

  Future<void> getString() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      AppConstants.themeMode = sharedPreferences.getString("themeMode")!;
      AppConstants.i = sharedPreferences.getInt('appbarIndex')!;
      AppConstants.k = sharedPreferences.getInt('drawerIndex')!;
      AppConstants.appBarColor = colors[AppConstants.i % 4];
      AppConstants.drawerColor = colors[AppConstants.k % 4];
      AppConstants.textSize = sharedPreferences.getDouble('textSize')!;
    });
  }

  void changeThemeMode(bool isDark) {
    AppConstants.themeMode = isDark ? 'dark' : 'light';
    saveString();
    setState(() {});
  }

  void changeAppBarColor() async {
    setState(() {
      AppConstants.i++;
      AppConstants.appBarColor = colors[AppConstants.i % 4];
      saveString();
    });
  }

  void changeDrawerColor() {
    AppConstants.k++;
    AppConstants.drawerColor = colors[AppConstants.k % 4];
    saveString();
    setState(() {});
  }

  void changeTextSize(double size) {
    AppConstants.textSize = size;
    saveString();
    setState(() {});
  }

  void changeBackgroundImage(String imageUrl) {
    if (imageUrl.trim().isNotEmpty) {
      AppConstants.backgroundImageUrl = imageUrl;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme:
                AppBarTheme(backgroundColor: AppConstants.appBarColor)),
        darkTheme: ThemeData.dark(),
        themeMode: AppConstants.themeMode == 'light'
            ? ThemeMode.light
            : ThemeMode.dark,
        home: PasswrodScreen(
            onThemeModeChanged: changeThemeMode,
            onBackgroundChanged: changeBackgroundImage,
            changeAppBarColor: changeAppBarColor,
            changeDrawerColor: changeDrawerColor,
            changeTextSize: changeTextSize));
  }
}
