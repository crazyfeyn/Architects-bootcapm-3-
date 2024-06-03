import 'package:application/controllers/settings_controller.dart';
import 'package:flutter/material.dart';

class SettingsNotifier extends InheritedNotifier<SettingsController> {
  SettingsNotifier({
    Key? key,
    required SettingsController settingsController,
    required Widget child,
  }) : super(key: key, notifier: settingsController, child: child);

  static SettingsController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SettingsNotifier>()!
        .notifier!;
  }
}
