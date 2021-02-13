import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/virtualCurrency/utilities/constants.dart';
import 'dart:io' show Platform;

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
            Platform.isIOS ? iosDropdown() : androidDropdown(),
          ],
        ),
      ),
    );
  }

  Widget androidDropdown() {
    List getdropdown() {
      var a = kcurrencyList.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList();
      return a;
    }

    // ignore: unused_element
    List<DropdownMenuItem<String>> getDropdoenItem() {
      List<DropdownMenuItem<String>> dropdownitem = [];
      for (var value in kcurrencyList) {
        var a = DropdownMenuItem(
          child: Text(value),
          value: value,
        );
        dropdownitem.add(a);
      }
      return dropdownitem;
    }

    return DropdownButton<String>(
      elevation: 15,
      value: selectedCurrencyValue,
      onChanged: (value) {
        print(value);
        setState(() {
          selectedCurrencyValue = value;
        });
      },
      items: getdropdown(),
    );
  }

  Widget iosDropdown() {
    List dropdownItem() {
      var a = kcurrencyList.map<Text>((String value) {
        return Text(value);
      }).toList();
      ;
      return a;
    }

    return Container(
      height: 200.0,
      width: 200.0,
      child: CupertinoPicker(
        itemExtent: 25.0,
        onSelectedItemChanged: (int value) {
          print(value);
        },
        children: dropdownItem(),
      ),
    );
  }
}

// [
// // kcurrencyList,
// DropdownMenuItem(
// child: Text('USD'),
// value: 'USD',
// ),
// DropdownMenuItem(
// child: Text('EURO'),
// value: 'EURO',
// ),
// DropdownMenuItem(
// child: Text('INR'),
// value: 'INR',
// ),
// ]

// CupertinoPicker(
// itemExtent: 50.0,
// onSelectedItemChanged: (value) {
// print(value);
// },
// children: kcurrencyList,
// )
