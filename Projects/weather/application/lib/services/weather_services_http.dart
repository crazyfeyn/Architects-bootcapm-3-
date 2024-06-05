import 'dart:convert';

import 'package:application/models/city.dart';
import 'package:application/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WeatherServices {
  Future<dynamic> getInfotmation(dynamic city) async {
    Uri url = city is String
        ? Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=353124e7e27814f76fb4c773a6a9ac82")
        : Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?lat=${city[0]}&lon=${city[1]}&limit={limit}&appid=353124e7e27814f76fb4c773a6a9ac82");
    List<Weather> loadedWeather = [];
    Future<void> saveLocation(String location) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('location', location);
    }

    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);
      City.selectedCity = data['city']['name'];
      saveLocation(City.selectedCity);
      data['list'].forEach((value) {
        loadedWeather.add(Weather.fromJson(value));
      });
    } catch (e) {
      return "City is underfined";
    }

    return loadedWeather;
  }
}
