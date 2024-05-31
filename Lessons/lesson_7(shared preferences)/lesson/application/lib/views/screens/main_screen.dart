import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool flag = false;
  String nameAndAge = "";
  List<String> colorList = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController colorsController = TextEditingController();

  Future<void> saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", nameController.text);
    await prefs.setInt("age", int.parse(ageController.text));
    await prefs.setStringList(
        "favoriteColors", colorsController.text.split(','));
  }

  Future<void> getString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      flag = !flag;
      nameAndAge = "${prefs.getString('name')}: is ${prefs.getInt("age")}";
      colorList = prefs.getStringList("favoriteColors")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared preferences')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Name:'),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Age:'),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: colorsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Favorite colors:'),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      if (nameController.text.trim().isNotEmpty &&
                          ageController.toString().isNotEmpty) {
                        await saveString();
                      }
                    },
                    child: Container(
                      width: 150,
                      color: Colors.yellow,
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text("Save"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await getString();
                    },
                    child: Container(
                      width: 150,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text("Get"),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              flag
                  ? Column(
                      children: [
                        for (var i in colorList)
                          Chip(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            label: Text(i),
                            avatar: const Icon(Icons.circle),
                          )
                      ],
                    )
                  : const Text("")
            ],
          ),
        ),
      ),
    );
  }
}
