import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/virtualCurrency/utilities/Network.dart';
import 'package:flutter_learning/virtualCurrency/utilities/constants.dart';
import 'dart:io' show Platform;

class Currency extends StatefulWidget {
  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  String selectedCurrencySign = 'INR';
  // ignore: non_constant_identifier_names
  double BTCexchangeValue;
  // ignore: non_constant_identifier_names
  double ETHexchangeValue;
  // ignore: non_constant_identifier_names
  double LTCexchangeValue;
  // String currencySign;

  void updateUi() async {
    BTCexchangeValue = 0.0;
    ETHexchangeValue = 0.0;
    LTCexchangeValue = 0.0;
    Network btcNetwork = Network('BTC/$selectedCurrencySign');
    Network ethNetwork = Network('ETH/$selectedCurrencySign');
    Network ltcNetwork = Network('LTC/$selectedCurrencySign');
    var data1 = await btcNetwork.getData();
    var data2 = await ethNetwork.getData();
    var data3 = await ltcNetwork.getData();
    print(data1);
    print(data2);
    print(data3);
    setState(() {
      BTCexchangeValue = data1['rate'].roundToDouble();
      ETHexchangeValue = data2['rate'].roundToDouble();
      LTCexchangeValue = data3['rate'].roundToDouble();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi();
  }

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
          CurrencyCard(
            cryptoType: 'BTC',
            exchangeValue: BTCexchangeValue,
            selectedCurrencySign: selectedCurrencySign,
          ),
          CurrencyCard(
            cryptoType: 'ETH',
            exchangeValue: ETHexchangeValue,
            selectedCurrencySign: selectedCurrencySign,
          ),
          CurrencyCard(
            cryptoType: 'LTC',
            exchangeValue: LTCexchangeValue,
            selectedCurrencySign: selectedCurrencySign,
          ),
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
      value: selectedCurrencySign,
      onChanged: (value) {
        print(value);

        setState(() {
          selectedCurrencySign = value;
        });
        updateUi();
      },
      items: getdropdown(),
    );
  }

  Widget iosDropdown() {
    List dropdownItem() {
      var a = kcurrencyList.map<Text>((String value) {
        return Text(value);
      }).toList();

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

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    Key key,
    @required this.exchangeValue,
    @required this.selectedCurrencySign,
    @required this.cryptoType,
  });

  final double exchangeValue;
  final String selectedCurrencySign;
  final String cryptoType;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      color: Colors.blue[300],
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
        child: Center(
            child: Text(
          '1 $cryptoType = $exchangeValue $selectedCurrencySign',
          style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold),
        )),
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
