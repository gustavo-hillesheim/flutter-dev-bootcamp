import 'dart:convert';

import 'package:http/http.dart' as http;

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
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinService {

  static Future<double> getExchangeRate(String cryptoCurrency, String currency) async {
    String url = 'https://rest.coinapi.io/v1/exchangerate/$cryptoCurrency/$currency?apikey=43CE3275-2974-4819-99BA-8A84E76BB3C1';
    Map<String, dynamic> exchangeInfo = await _makeRequest(url);
    return exchangeInfo['rate'] ?? 0;
  }

  static Future<Map<String, dynamic>> _makeRequest(String url) async {
    http.Response response = await http.get(url);
    return jsonDecode(response.body);
  }
}
