import 'package:flutter/material.dart';
import 'package:flutter_learning/weather/constants.dart';
import 'package:flutter_learning/weather/screens/LocationScreen.dart';
// import 'package:flutter_learning/weather/screens/LocationScreen.dart';
import 'package:flutter_learning/weather/services/Location.dart';
import 'package:flutter_learning/weather/services/networking.dart';
// import 'package:flutter_learning/routes.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    // getLocation();
    getLocation();
  }

  Future<void> getLocation() async {
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;

    NetworkHelper network = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kweatherApiKey');

    var weatherData = await network.getWeather();
    print(weatherData);
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
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            print('pressed Get Location');
            // getLocation();
            // getLocation();
            // Navigator.pushNamed(context, 'weather/locationScreen');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LocationScreen()),
            );
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
