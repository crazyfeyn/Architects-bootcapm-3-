import 'package:application/utils/routes.dart';
import 'package:application/views/screens/home_screen.dart';
import 'package:application/views/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const HomeScreen(),
      routes: AppRoutes.routes,
    );
  }
}