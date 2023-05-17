import 'dart:convert';

import 'package:http/http.dart' as http;

const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = 'b8f27a8b1690e0c92d40c32cfc385eea';

class WeatherService {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$weatherApiUrl?q=$cityName&appid=$apiKey&units=metric';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String weatherData = response.body;
      return json.decode(weatherData);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getContryName() async {
    var url = 'https://flagcdn.com/en/codes.json';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String Data = response.body;
      return json.decode(Data);
    } else {
      print(response.statusCode);
    }
  }

  String getWeatherIcon(int condition) {
    if (condition > 28) {
      return '🌡️';
    } else if (condition < 9) {
      return '❄️';
    } else {
      return '🌞';
    }
  }

}
