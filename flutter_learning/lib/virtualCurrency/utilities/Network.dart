import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  final String baseUrl = 'https://rest.coinapi.io/v1/exchangerate/';

  final String subUrl;

  Network(this.subUrl);

  getData() async {
    String url = this.baseUrl + this.subUrl;
    http.Response response = await http.get(url,
        headers: {'X-CoinAPI-Key': 'F9115751-6149-4962-AFC6-166277D51620'});

    if (response.statusCode == 200) {
      // print(response.body);
      var data = jsonDecode(response.body);
      return data;
    } else {
      print(response.statusCode);
      print('some bad happended in network');
    }
  }
}
