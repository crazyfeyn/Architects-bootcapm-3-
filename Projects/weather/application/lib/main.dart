import 'package:application/models/city.dart';
import 'package:application/views/screens/loading_screen.dart';
import 'package:application/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    void loadingPage() async {
      Future.delayed(Duration(seconds: 1)).then((value) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoadingScreen())));
    }

    @override
    void initState() {
      super.initState();
      loadingPage();
    }

    return ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          home: HomeScreen(latLung: City.selectedCity),
        ));
  }
}
