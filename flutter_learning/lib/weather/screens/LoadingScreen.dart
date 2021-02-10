import 'package:flutter/material.dart';
import 'package:flutter_learning/weather/screens/LocationScreen.dart';
import 'package:flutter_learning/weather/services/WeatherModel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    // getLocation();
    getLocation();
  }

  Future<void> getLocation() async {
    // print(weatherData);
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getCurrentWeatherData();
    print(weatherData);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(
                locationWeather: weatherData,
              )),
    );
  }

  // getData() {
  //   location.getCurrentLocation();
  //   latitude = location.latitude;
  //   longitude = location.longitude;
  //   location.getWeather();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SpinKitWave(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
