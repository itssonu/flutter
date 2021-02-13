import 'package:flutter/material.dart';
import 'package:flutter_learning/weather/screens/CityScreen.dart';
import 'package:flutter_learning/weather/screens/LoadingScreen.dart';
import 'package:flutter_learning/weather/services/WeatherModel.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  const LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String weatherIcon;
  String weatherMessage;
  String cityName;
  String description;
  int temp;
  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.locationWeather != null) {
      updateUi(widget.locationWeather);
    }
  }

  void updateUi(dynamic weatherData) {
    int id = weatherData['weather'][0]['id'];
    weatherIcon = weatherModel.getWeatherIcon(id);
    cityName = weatherData['name'];
    description = weatherData['weather'][0]['description'];
    temp = weatherData['main']['temp'].toInt();
    weatherMessage = weatherModel.getMessage(temp);
    // print(temp);

    // print(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/weather/location_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      // print("current location ");
                      // WeatherModel weatherModel = WeatherModel();
                      // var weatherData =
                      //     await weatherModel.getCurrentWeatherData();
                      // updateUi(weatherData);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadingScreen()),
                      );
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      var typeName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      // print(typeName);
                      if (typeName != null) {
                        var cityweatherData =
                            await weatherModel.getCityWeatherData(typeName);
                        setState(() {
                          updateUi(cityweatherData);
                        });
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Text(
                      '$temp° $weatherIcon',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          '$weatherMessage  in $cityName',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
