import 'dart:convert';

import 'package:application/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  Future<dynamic> getInfotmation(String city) async {
    Uri url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=tashkent&appid=353124e7e27814f76fb4c773a6a9ac82");
    List<Weather> loadedWeather = [];
    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);
      data['list'].forEach((value) {
        loadedWeather.add(Weather.fromJson(value));
      });
    } catch (e) {
      return "Shaxar topilmadi";
    }

    // print(loadedWeather);
  }
}
