import 'package:application/utils/app_constants.dart';
import 'package:application/views/screens/password_screen.dart';
import 'package:application/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<bool> onThemeModeChanged;
  final ValueChanged<String> onBackgroundChanged;
  final changeAppBarColor;
  final changeDrawerColor;
  const HomeScreen({
    super.key,
    required this.onThemeModeChanged,
    required this.onBackgroundChanged,
    required this.changeAppBarColor,
    required this.changeDrawerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home screen',
          style: TextStyle(fontSize: AppConstants.textSize),
        ),
      ),
      drawer: CustomDrawer(
        onThemeModeChanged: onThemeModeChanged,
        onBackgroundChanged: onBackgroundChanged,
        changeAppBarColor: changeAppBarColor,
        changeDrawerColor: changeDrawerColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: ((context) => PasswrodScreen(
                          onThemeModeChanged: onThemeModeChanged,
                          onBackgroundChanged: onBackgroundChanged,
                          changeAppBarColor: changeAppBarColor,
                          changeDrawerColor: changeDrawerColor,
                        ))));
              },
              child: Icon(Icons.lock_open),
            ),
          ],
        ),
      ),
    );
  }
}
