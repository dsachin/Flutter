import 'dart:convert';
import 'package:http/http.dart' as http;
import 'coin_data.dart';

const kApiUrl = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class Helper {
  Future getConversionData(String selectedCurrency) async {
    List<CoinData> tempCoinDataList = [];
    for (String crypto in cryptoList) {
      CoinData coin = CoinData();
      coin.crypto = crypto;
      coin.currency = selectedCurrency;
      coin.conversionValue =
          await getDataFromNetwork(crypto + selectedCurrency);
      print(coin.conversionValue);
      tempCoinDataList.add(coin);
    }
    return tempCoinDataList;
  }

  Future getDataFromNetwork(String currencyConversionKey) async {
    String url = kApiUrl + currencyConversionKey;
    http.Response response = await http.get(url,
        headers: {'x-ba-key': 'MzZmMTk4NTJiM2I4NGU0MmJlMjI2MjcyZTllMWI0OTE'});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['last'];
    } else {
      print('Error Code: ${response.statusCode} Error in receiving data');
    }
  }
}
