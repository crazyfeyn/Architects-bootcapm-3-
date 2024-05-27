import 'package:application/utils/app_constants.dart';
import 'package:application/views/screens/password_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void changeThemeMode(bool isDark) {
    AppConstants.themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  void changeBackgroundImage(String imageUrl) {
    if (imageUrl.trim().isNotEmpty) {
      AppConstants.backgroundImageUrl = imageUrl;
      setState(() {});
    }
  }

  List colors = [Colors.yellow, Colors.amber, Colors.blue, Colors.purple];
  int i = 0;
  int k = 2;

  void changeAppBarColor() {
    AppConstants.appBarColor = colors[i % 4];
    i++;
    setState(() {});
  }

  void changeDrawerColor() {
    AppConstants.drawerColor = colors[k % 4];
    k--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme:
                AppBarTheme(backgroundColor: AppConstants.appBarColor)),
        darkTheme: ThemeData.dark(),
        themeMode: AppConstants.themeMode,
        home: PasswrodScreen(
          onThemeModeChanged: changeThemeMode,
          onBackgroundChanged: changeBackgroundImage,
          changeAppBarColor: changeAppBarColor,
          changeDrawerColor: changeDrawerColor,
        ));
  }
}
