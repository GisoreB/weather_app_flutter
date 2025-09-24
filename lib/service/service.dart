import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather_model.dart';

class WeatherServices {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=-1.2833&lon=36.8167&appid=509079b22fae7e954dff8403ef5eba0e"),
    );
    // now we can change latitude and longitude and let's see how it perform.
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load Weather data');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
// replace the api key with your api key the openWeatherMap provide you
// for your current location provide the longitude and latitude of your current location