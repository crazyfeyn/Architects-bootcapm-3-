import 'package:flutter/material.dart';
import 'package:goora/repositories/settings_controller.dart';

class SettingsNotifier extends InheritedNotifier<SettingsController> {
  const SettingsNotifier({
    Key? key,
    required SettingsController notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static SettingsController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SettingsNotifier>()!.notifier!;
  }

  @override
  bool updateShouldNotify(covariant SettingsNotifier oldWidget) {
    return notifier != oldWidget.notifier;
  }
}
