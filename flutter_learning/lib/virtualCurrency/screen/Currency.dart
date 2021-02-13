import 'package:flutter/material.dart';
import 'package:flutter_learning/virtualCurrency/utilities/constants.dart';

class Currency extends StatefulWidget {
  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  String selectedCurrencyValue = 'INR';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Virtual Currency Price'.toUpperCase(),
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            margin: EdgeInsets.all(30.0),
            color: Colors.blue[300],
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 20.0),
              child: Center(
                  child: Text(
                '1 BTC = ? USD',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        color: Colors.blue[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedCurrencyValue,
              onChanged: (value) {
                print(value);
                setState(() {
                  selectedCurrencyValue = value;
                });
              },
              items: [
                kcurrencyList.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem(
                    child: Text('USD'),
                    value: 'USD',
                  );
                }),
                DropdownMenuItem(
                  child: Text('USD'),
                  value: 'USD',
                ),
                DropdownMenuItem(
                  child: Text('EURO'),
                  value: 'EURO',
                ),
                DropdownMenuItem(
                  child: Text('INR'),
                  value: 'INR',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
