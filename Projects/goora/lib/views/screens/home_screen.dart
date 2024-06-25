import 'package:flutter/material.dart';
import 'package:goora/utils/notifier/settings_notifier.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = SettingsNotifier.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
