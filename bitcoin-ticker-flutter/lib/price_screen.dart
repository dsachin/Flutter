import 'package:bitcoin_ticker/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<CoinData> coinDataList = [];
  String selectedCurrency = currenciesList[0];

  @override
  void initState() {
    super.initState();
    getDataAndUpdate();
  }

  getDataAndUpdate() async {
    var tempcoinDataList = await Helper().getConversionData(selectedCurrency);
    updateUI(tempcoinDataList);
  }

  DropdownButton getAndroidPicker() {
    List<DropdownMenuItem> currencyList = List<DropdownMenuItem>();

    for (String currency in currenciesList) {
      DropdownMenuItem menuItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      currencyList.add(menuItem);
    }

    return DropdownButton(
        value: selectedCurrency,
        items: currencyList,
        onChanged: (value) async {
          selectedCurrency = value;
          var tempcoinDataList =
              await Helper().getConversionData(selectedCurrency);
          updateUI(tempcoinDataList);
        });
  }

  updateUI(dynamic tempcoinDataList) {
    setState(() {
      selectedCurrency = tempcoinDataList[0].currency;
      if (tempcoinDataList != null && tempcoinDataList.length != 0) {
        coinDataList = tempcoinDataList;
      } else {
        CoinData coin = CoinData();
        coin.crypto = "Error";
        coin.currency = "Unable to receive data from server.";
        coin.conversionValue = 420;
        coinDataList = [];
        coinDataList.add(coin);
      }
    });
  }

  CupertinoPicker getIosPicker() {
    List<Text> currencyList = [];
    for (String currency in currenciesList) {
      currencyList.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: currencyList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: getConversionWidgets(coinDataList),
      ),
    );
  }

  List<Widget> getConversionWidgets(List<CoinData> coinDataList) {
    List<Widget> widgets = [];
    for (CoinData coinData in coinDataList) {
      Padding conversionCard = Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 ${coinData.crypto} = ${coinData.conversionValue} ${coinData.currency}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
      widgets.add(conversionCard);
    }
    Container container = Container(
      height: 150.0,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 30.0),
      color: Colors.lightBlue,
      child: Platform.isIOS ? getIosPicker() : getAndroidPicker(),
    );
    widgets.add(container);
    return widgets;
  }
}
