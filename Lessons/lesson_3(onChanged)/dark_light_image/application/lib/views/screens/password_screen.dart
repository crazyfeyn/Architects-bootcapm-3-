import 'package:application/utils/app_constants.dart';
import 'package:application/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class PasswrodScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeModeChanged;
  final ValueChanged<String> onBackgroundChanged;
  final changeDrawerColor;
  final changeAppBarColor;
  final changeTextSize;
  const PasswrodScreen(
      {super.key,
      required this.onThemeModeChanged,
      required this.onBackgroundChanged,
      required this.changeAppBarColor,
      required this.changeDrawerColor,
      required this.changeTextSize,
      });

  @override
  State<PasswrodScreen> createState() => _PasswrodScreenState();
}

class _PasswrodScreenState extends State<PasswrodScreen> {
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Password screen',
          style: TextStyle(fontSize: AppConstants.textSize),
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: AppConstants.textSize),
              border: const OutlineInputBorder(),
              hintText: AppConstants.passwrod.isEmpty
                  ? 'set password'
                  : 'enter password',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                if (AppConstants.passwrod.isNotEmpty &&
                    passwordController.text == AppConstants.passwrod) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => HomeScreen(
                                onThemeModeChanged: widget.onThemeModeChanged,
                                onBackgroundChanged: widget.onBackgroundChanged,
                                changeAppBarColor: widget.changeAppBarColor,
                                changeDrawerColor: widget.changeDrawerColor,
                                changeTextSize: widget.changeTextSize
                              ))));
                } else if (AppConstants.passwrod.isEmpty &&
                    passwordController.text.trim().isNotEmpty) {
                  AppConstants.passwrod = passwordController.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => HomeScreen(
                                onThemeModeChanged: widget.onThemeModeChanged,
                                onBackgroundChanged: widget.onBackgroundChanged,
                                changeAppBarColor: widget.changeAppBarColor,
                                changeDrawerColor: widget.changeDrawerColor,
                                changeTextSize: widget.changeTextSize
                              ))));
                  setState(() {});
                }
                setState(() {
                  passwordController.clear();
                });
              },
              child: Card(
                color: Colors.red,
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  width: 300,
                  child: Text(
                    'Click',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: AppConstants.textSize),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
