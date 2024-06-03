import 'package:application/notifiers/settings_notifier.dart';
import 'package:application/utils/app_constatnts.dart';
import 'package:flutter/material.dart';

Widget navigationRailWidget(BuildContext context) {
  return NavigationRail(
    onDestinationSelected: (value) =>
        SettingsNotifier.of(context).changeBottomIndex(value),
    selectedIndex: AppConstatnt.curBottomIndex,
    destinations: const [
      NavigationRailDestination(
        icon: Icon(Icons.home),
        label: Text('home'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.bar_chart),
        label: Text('statistics'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.person),
        label: Text('profile'),
      ),
    ],
  );
}
