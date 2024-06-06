import 'package:application/services/weather_services_http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String curLocation = 'tashkent';
  WeatherServices weatherServices = WeatherServices();

  Future<void> saveChanges() async {}

  Future<void> getChanges() async {}

  @override
  void initState() {
    // _askLocation();
    super.initState();
  }

  // Future<void> _askLocation() async {
  //   Location location = Location();

  //   bool serviceEnabled;
  //   PermissionStatus permissionGranted;
  //   LocationData locationData;

  //   serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled) {
  //       return;
  //     }
  //   }

  //   permissionGranted = await location.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   locationData = await location.getLocation();
  //   print(locationData);
  //   // if (locationData.latitude != null) {
  //   //   if (!mounted) return;
  //   //   Navigator.pushReplacement(context, MaterialPageRoute(
  //   //     builder: (context) {
  //   //       return MainScreen();
  //   //     },
  //   //   ));
  //   // }
  // }

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
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 45.h,
                      height: 0),
                ),
                Text(
                  'ForeCast',
                  style: TextStyle(
                      color: Color(0xFFDDB130),
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

String getWeekDay(int weekDayNumber) {
  switch (weekDayNumber) {
    case DateTime.monday:
      return "Mon";
    case DateTime.tuesday:
      return "Tue";
    case DateTime.wednesday:
      return "Wed";
    case DateTime.thursday:
      return "Thu";
    case DateTime.friday:
      return "Fri";
    case DateTime.saturday:
      return "Sat";
    case DateTime.sunday:
      return "Sun";
    default:
      return "Noma'lum kun";
  }
}
