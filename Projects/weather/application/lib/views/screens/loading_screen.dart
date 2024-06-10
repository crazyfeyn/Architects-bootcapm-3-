import 'package:application/services/weather_services_http.dart';
import 'package:application/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherServices weatherServices = WeatherServices();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (ctx) => HomeScreen(latLung: '')));
    });
  }


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
              Color.fromARGB(255, 245, 203, 253),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/initial_image.png'),
            Column(
              children: [
                Text(
                  'Weather',
                  style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 45.h,
                      height: 0),
                ),
                Text(
                  'ForeCast',
                  style: TextStyle(
                      color: const Color(0xFFDDB130),
                      fontWeight: FontWeight.w600,
                      fontSize: 45.h,
                      height: 0),
                )
              ],
            ),
            SizedBox(height: 150.h),
          ],
        ),
      )),
    );
  }
}