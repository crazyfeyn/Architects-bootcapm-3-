import 'package:application/models/city.dart';
import 'package:application/services/weather_services_http.dart';
import 'package:application/views/screens/main_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  WeatherServices weatherController = WeatherServices();
  TextEditingController searchController = TextEditingController();
  String? searchError;
  bool searchCheck = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFF1D2547),
                    Color(0xFF1D2547),
                    Color.fromARGB(255, 103, 63, 184),
                    Color.fromARGB(255, 178, 123, 189),
                  ])),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: const Text(
                          "Shaxar nomini ingliz tilida kiriting",
                          style: TextStyle(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        suffixIcon: searchCheck
                            ? IconButton(
                                onPressed: () async {
                                  setState(() {
                                    searchCheck = false;
                                  });
                                  final box = await weatherController
                                      .getInfotmation(searchController.text);
                                  if (box is String) {
                                    searchError = box;
                                    setState(() {
                                      searchCheck = true;
                                    });
                                  } else {
                                    searchCheck = true;
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(
                                              latLung: searchController.text),
                                        ));
                                  }
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ))
                            : SizedBox(
                                width: 10,
                                child: Image.asset("assets/load.gif"),
                              ),
                        errorText: searchError,
                      ),
                    ),
                  ),
                ],
              ))),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 178, 123, 189),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(latLung: City.selectedCity),
                      ));
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 80,
                )),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}