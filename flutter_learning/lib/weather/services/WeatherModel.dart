import 'package:flutter_learning/weather/constants.dart';
import 'package:flutter_learning/weather/services/Location.dart';
import 'package:flutter_learning/weather/services/networking.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
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

  String getMessage(int temp) {
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

  Future<dynamic> getCityWeatherData(String cityName) async {
    // Location location = Location();
    // await location.getCurrentLocation();
    // double latitude = location.latitude;
    // double longitude = location.longitude;

    NetworkHelper network = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kweatherApiKey&units=metric');

    var weatherData = await network.getData();
    // print("sonu");
    return weatherData;
  }

  Future<dynamic> getCurrentWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;

    NetworkHelper network = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kweatherApiKey&units=metric');

    var weatherData = await network.getData();
    return weatherData;
  }
}
