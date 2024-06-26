import 'package:application/utils/app_constants.dart';
import 'package:application/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeModeChanged;
  final ValueChanged<String> onBackgroundChanged;
  final changeDrawerColor;
  final changeAppBarColor;
  final changeTextSize;
  const SettingsScreen({
    super.key,
    required this.onThemeModeChanged,
    required this.onBackgroundChanged,
    required this.changeAppBarColor,
    required this.changeDrawerColor,
    required this.changeTextSize,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String urlController = "";
  String newPasswrod = "";
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings screen',
          style: TextStyle(fontSize: AppConstants.textSize),
        ),
      ),
      drawer: CustomDrawer(
          onThemeModeChanged: widget.onThemeModeChanged,
          onBackgroundChanged: widget.onBackgroundChanged,
          changeAppBarColor: widget.changeAppBarColor,
          changeDrawerColor: widget.changeDrawerColor,
          changeTextSize: widget.changeTextSize),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: AppConstants.backgroundImageUrl.isEmpty
                ? null
                : DecorationImage(
                    image: NetworkImage(AppConstants.backgroundImageUrl),
                    fit: BoxFit.cover)),
        child: Column(
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == 'dark',
              onChanged: (value) {
                widget.onThemeModeChanged(value);
              },
              title: Text(
                "Tungi holat",
                style: TextStyle(fontSize: AppConstants.textSize),
              ),
            ),
            TextFormField(
              controller: newPasswordController,
              decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: AppConstants.textSize),
                  hintStyle: TextStyle(fontSize: AppConstants.textSize),
                  border: const OutlineInputBorder(),
                  hintText: 'new password',
                  labelText: 'new password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (newPasswordController.text.trim().isNotEmpty) {
                          AppConstants.passwrod = newPasswordController.text;
                          newPasswordController.clear();
                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.send))),
            ),
            InkWell(
              onTap: () {
                widget.changeAppBarColor();
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Text(
                  'change appbars colors',
                  style: TextStyle(fontSize: AppConstants.textSize),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.changeDrawerColor();
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Text(
                  'change drawers colors',
                  style: TextStyle(fontSize: AppConstants.textSize),
                ),
              ),
            ),
            Slider(
                value: AppConstants.textSize,
                min: 10,
                max: 25,
                divisions: 15,
                label: AppConstants.textSize.toString(),
                onChanged: (double value) {
                  setState(() {
                    widget.changeTextSize(value);
                  });
                })
          ],
        ),
      ),
    );
  }
}
