import 'package:http/http.dart' as http;
// import 'package:flutter_learning/weather/constants.dart';

import 'dart:convert';

class NetworkHelper {
  final url;
  NetworkHelper({this.url});

  Future getWeather() async {
    // String url =
    //     'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kweatherApiKey';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String a = response.body;
      // var data = jsonDecode(a);
      // var id = data['weather'][0]['id'];
      // var cityName = data['name'];
      // var description = data['weather'][0]['description'];
      // var temp = data['main']['temp'];
      // print(
      //     'id = $id, city = $cityName, description = $description, tempreature = $temp');
      return a;
    } else {
      print('something wrng with with weatger api');
      print(response.statusCode);
    }
  }
}
