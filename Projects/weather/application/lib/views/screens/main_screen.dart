import 'package:application/models/city.dart';
import 'package:application/models/weather.dart';
import 'package:application/services/weather_services_http.dart';
import 'package:application/views/screens/more_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> monthNames = [
  'Yanvar',
  'Fevral',
  'Mart',
  'Aprel',
  'May',
  'Iyun',
  'Iyul',
  'Avgust',
  'Sentabr',
  'Oktabr',
  'Noyabr',
  'Dekabr'
];

class HomeScreen extends StatefulWidget {
  dynamic latLung;
  HomeScreen({super.key, required this.latLung});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherServices weatherController = WeatherServices();
  bool checkLocationGif = true;
  bool isLoading = true;
  WeatherServices weatherServices = WeatherServices();

  late List<Weather> weathers;

  Future<void> loadWeatherData() async {
    weathers = await weatherServices.getInfotmation("tashkent");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: weatherServices.getInfotmation('tashkent'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (!snapshot.hasData) {
                    return Container(
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
                      child: const Center(
                        child: Text('Data is not found'),
                      ),
                    );
                  } else {
                    List<Weather> weathers = snapshot.data;
                    return Container(
                      padding: EdgeInsets.only(top: 60.h),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            City.selectedCity,
                            style: GoogleFonts.poppins(
                                fontSize: 23.h,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/${weathers[0].weather[0]['icon']}.png",
                                width: 180.w,
                              ),
                              Text(
                                  "${(weathers[0].main['temp'] - 273.15) ~/ 1}°",
                                  style: GoogleFonts.poppins(
                                    fontSize: 45.h,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Text("${weathers[0].weather[0]['main']}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 30.h,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "Max: ${(weathers[0].main['temp_max'] - 273.15) ~/ 1}°",
                                      style: GoogleFonts.poppins(
                                          fontSize: 24.h,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(width: 30.w),
                                  Text(
                                      "Min: ${(weathers[0].main['temp_min'] - 273.15) ~/ 1}°",
                                      style: GoogleFonts.poppins(
                                          fontSize: 24.h,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/images/home.png',
                            height: 180.h,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(255, 178, 123, 189),
                                    Color.fromARGB(255, 103, 63, 184),
                                    Color(0xFF1D2547),
                                  ]),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 14.h, horizontal: 18.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Today",
                                          style: GoogleFonts.poppins(
                                              fontSize: 20.h,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white)),
                                      Text(
                                          "${monthNames[weathers[0].dt_txt.month - 1]}, ${weathers[0].dt_txt.day}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 20.h,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.h,
                                  color:
                                      const Color.fromARGB(255, 183, 167, 223),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 20.h),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        for (var i = 0; i < 9; i++)
                                          hoursInformation(weathers[i]),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                }),
          )),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 178, 123, 189),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            checkLocationGif
                ? IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                : SizedBox(
                    width: 40,
                    child: Image.asset("assets/load.gif"),
                  ),
            IconButton(
                onPressed: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SearchScreen(),
                  //   )
                  // );
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 45,
                )),
            IconButton(
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const MoreInformationScreen();
                    },
                  ));
                },
                icon: const Icon(
                  CupertinoIcons.line_horizontal_3,
                  color: Colors.white,
                  size: 55,
                ))
          ],
        ),
      ),
    );
  }
}

Widget hoursInformation(Weather weather) {
  return Row(
    children: [
      SizedBox(
        height: 130.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${(weather.main['temp'] - 273.15) ~/ 1}℃",
                style: GoogleFonts.poppins(
                    fontSize: 25.h,
                    color: Colors.white,
                    height: -0,
                    fontWeight: FontWeight.w500)),
            SizedBox(
                width: 50.w,
                child: weather.dt_txt.hour > 5 && weather.dt_txt.hour < 21
                    ? Image.asset(
                        "assets/images/${weather.weather[0]['icon']}.png",
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/images/${weather.weather[0]['icon']}.png",
                        fit: BoxFit.cover,
                      )),
            Text("${weather.dt_txt.hour}:00",
                style: GoogleFonts.poppins(
                    fontSize: 24.h,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 1.h,
        height: 90.h,
        color: const Color.fromARGB(255, 183, 167, 223),
      ),
    ],
  );
}
