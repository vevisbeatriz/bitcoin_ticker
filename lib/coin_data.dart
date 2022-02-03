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
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

// https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=503FF23C-79DF-46DA-8BE0-9B9449558AB9

const apiKey = '503FF23C-79DF-46DA-8BE0-9B9449558AB9';
const openCoinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String currency) async {
    //TODO 4: Use a for loop here to loop through the cryptoList and request the data for each of them in turn.
    //TODO 5: Return a Map of the results instead of a single value.
    Map<String, String> cryptoMap = {};

    for (String cryptoCurrency in cryptoList) {
      http.Response response = await http.get(Uri.parse(
          '$openCoinAPIURL/$cryptoCurrency/$currency?apikey=$apiKey'));

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['rate'];
        cryptoMap[cryptoCurrency] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw Exception('Failed to load currency');
      }
    }

    return cryptoMap;
  }
}
