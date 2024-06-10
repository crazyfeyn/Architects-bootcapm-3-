import 'package:application/notifiers/settings_notifier.dart';
import 'package:application/utils/app_constatnts.dart';
import 'package:application/views/screens/courses_screen.dart';
import 'package:application/views/screens/home_screen.dart';
import 'package:application/views/screens/profile_screen.dart';
import 'package:application/views/screens/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const StatisticsScreen(),
  ];

  List<Widget> realPages = const [
    HomeScreen(),
    StatisticsScreen(),
    ProfileScreen(),
    CoursesScreen(),
  ];
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: realPages[AppConstatnt.curBottomIndex],
        bottomNavigationBar: AppConstatnt.screenW < 600
            ? BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: AppConstatnt.curBottomIndex,
                onTap: (value) =>
                    SettingsNotifier.of(context).changeBottomIndex(value),
                items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.bar_chart), label: 'statistics'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'profile'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.library_add), label: 'Courses'),
                  ])
            : null);
  }
}
