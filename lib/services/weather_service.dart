import 'dart:convert';
import 'package:clima/services/location_service.dart';
import 'package:http/http.dart' as http;
import 'package:clima/env/env.dart';


const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherInfo {
  final int temp;
  final int condition;
  final String cityName;

  WeatherInfo(
      {required this.temp, required this.condition, required this.cityName});
  String getWeatherIcon() {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

Future<WeatherInfo> getLocalWeather(Location location) async {
  http.Response response = await http.get(Uri.parse(
      '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitutde}&appid=$apiKey&units=metric'));
  if (response.statusCode == 200) {
    String data = response.body;
    var weather = jsonDecode(data);
    return WeatherInfo(
        temp: weather['main']['temp'].toInt(),
        condition: weather['weather'][0]['id'],
        cityName: weather['name']);
  } else {
    print(response.statusCode);
    throw Exception("An error has occured while parsing url");
  }
}

Future<WeatherInfo> getCityWeather(String city) async {
  http.Response response = await http
      .get(Uri.parse('$openWeatherMapURL?q=$city&appid=$apiKey&units=metric'));
  if (response.statusCode == 200) {
    String data = response.body;
    var weather = jsonDecode(data);
    return WeatherInfo(
        temp: weather['main']['temp'].toInt(),
        condition: weather['weather'][0]['id'],
        cityName: city);
  } else {
    throw Exception("An error has occured while parsing url");
  }
}
