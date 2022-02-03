import 'package:bitcoin_ticker/services/networking.dart';

// https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=503FF23C-79DF-46DA-8BE0-9B9449558AB9

const apiKey = '503FF23C-79DF-46DA-8BE0-9B9449558AB9';
const openWeatherMapURL = 'https://rest.coinapi.io/v1/exchangerate/';

class CoinModel {
  Future<dynamic> getCoinData(String coin, String currency) async {
    NetworkHelper networkHelper =
        NetworkHelper('$coin/$currency?appid=$apiKey&units=metric');

    var coinData = await networkHelper.getData();
    return coinData;
  }
}
