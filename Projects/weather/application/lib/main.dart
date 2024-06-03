import 'package:application/controllers/settings_controller.dart';
import 'package:application/utils/settings_notifier.dart';
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SettingsNotifier(
          key: key,
          settingsController: SettingsController(),
          child: Builder(builder: (context) {
            return ListenableBuilder(
                listenable: SettingsNotifier.of(context),
                builder: (context, child) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    darkTheme: ThemeData.dark(),
                    themeMode: SettingsNotifier.of(context).settings.themeMode,
                    home: const MainScreen(),
                  );
                });
          })),
    );
  }
}
