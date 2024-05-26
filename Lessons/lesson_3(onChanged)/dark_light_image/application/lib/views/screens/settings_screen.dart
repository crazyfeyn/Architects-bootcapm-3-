import 'package:application/utils/app_constants.dart';
import 'package:application/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeModeChanged;
  final ValueChanged<String> onBackgroundChanged;
  final changeDrawerColor;
  final changeAppBarColor;
  const SettingsScreen(
      {super.key,
      required this.onThemeModeChanged,
      required this.onBackgroundChanged,
      required this.changeAppBarColor,
      required this.changeDrawerColor,
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

  final _formKey = GlobalKey<FormState>();
  String urlController = "";
  String newPasswrod = "";
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings screen'),
      ),
      drawer: CustomDrawer(
        onThemeModeChanged: widget.onThemeModeChanged,
        onBackgroundChanged: widget.onBackgroundChanged,
        changeAppBarColor: widget.changeAppBarColor,
        changeDrawerColor: widget.changeDrawerColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: AppConstants.backgroundImageUrl.isEmpty
                ? null
                : DecorationImage(
                    image: NetworkImage(AppConstants.backgroundImageUrl))),
        child: Column(
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == ThemeMode.dark,
              onChanged: (value) {
                widget.onThemeModeChanged(value);
              },
              title: const Text("Tungi holat"),
            ),
            Form(
                key: _formKey,
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'url',
                      labelText: 'url',
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (controller.text.trim().isNotEmpty) {
                              widget.onBackgroundChanged(controller.text);
                              controller.clear();
                            }
                          },
                          icon: const Icon(Icons.send))),
                )),
            TextFormField(
              controller: newPasswordController,
              decoration: InputDecoration(
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
                    BoxDecoration(border: Border.all(color: Colors.black)),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'change appbars colors',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.changeDrawerColor();
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'change drawers colors',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
