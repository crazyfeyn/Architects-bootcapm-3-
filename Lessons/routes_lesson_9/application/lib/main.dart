import 'package:application/screens/pages/home_screen.dart';
import 'package:application/screens/pages/second_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomeScreen(),
      //   '/second': (context) => SecondScreen()
      // },
      onGenerateRoute: ((settings) {
        if (settings.name == '/second') {
          return MaterialPageRoute(builder: (context) {
            return SecondScreen(data: settings.arguments as String);
          });
        }
        return MaterialPageRoute(builder: (context) => HomeScreen());
      }),
    );
  }
}
