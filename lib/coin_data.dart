import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
  'EGY'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    http.Response response = await http.get(
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC$selectedCurrency');
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      var lastPrice = decodeData['last'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'problem with the get request';
    }
  }
}



// api-key ==> YjMyZGFiYzVjYjE4NDdiMmIwOTRjMDVkMjljYjBkYjI

// https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD