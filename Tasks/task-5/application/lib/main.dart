import 'package:application/controllers/settings_controller.dart';
import 'package:application/notifiers/settings_notifier.dart';
import 'package:application/views/screens/home_screen.dart';
import 'package:application/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;

    return ScreenUtilInit(
        designSize: Size(
          screenW,
          screenH,
        ),
        child: SettingsNotifier(
          key: key,
          settingsController: SettingsController(),
          child: Builder(builder: (context) {
            SettingsNotifier.of(context).setW(screenW);
            return ListenableBuilder(
              listenable: SettingsNotifier.of(context),
              builder: ((context, child) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    darkTheme: ThemeData.dark(),
                    home: const MainScreen(),
                  )),
            );
          }),
        ));
  }
}
