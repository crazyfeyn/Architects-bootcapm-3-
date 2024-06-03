import 'package:application/notifiers/settings_notifier.dart';
import 'package:application/utils/app_constatnts.dart';
import 'package:application/views/screens/home_screen.dart';
import 'package:application/views/screens/profile_screen.dart';
import 'package:application/views/screens/statistics_screen.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _getSelectedWidget(AppConstatnt.curBottomIndex),
        bottomNavigationBar: AppConstatnt.screenW < 600
            ? BottomNavigationBar(
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
                  ])
            : null);
  }

  

  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const StatisticsScreen();
      default:
        return const ProfileScreen();
    }
  }
}
