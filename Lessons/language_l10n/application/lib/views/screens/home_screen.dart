import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.napples(1)),
      ),
      body: Center(
        child: Column(
          children: [
            Localizations.override(
              context: context,
              child: Builder(builder: (context) {
                return CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2050),
                    onDateChanged: (value) {});
              }),
            )
          ],
        ),
      ),
    );
  }
}
