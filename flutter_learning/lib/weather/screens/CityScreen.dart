import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CityScreen extends StatelessWidget {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/weather/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter City Name',
                          icon: Icon(Icons.location_city, color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {
                          cityName = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      print('get wather on city screen pressed');
                      Navigator.pop(context, cityName);
                    },
                    child: Text(
                      'Get Weather',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
