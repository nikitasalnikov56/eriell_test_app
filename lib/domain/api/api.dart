import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:eriell_app/domain/model/bitcoin_price_data.dart';

class Api{
 static final dio = Dio();

  // Настройка HTTP-клиента для игнорирования ошибок сертификатов
  static void setupHttpClient() {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
  }

  static Future<BitcoinPriceData> getBitcoinPriceData() async{
     setupHttpClient(); 
    final response = await dio.get('https://api.coindesk.com/v1/bpi/currentprice.json');

    try {
      final bitcoinPriceData = BitcoinPriceData.fromJson(response.data);
      return bitcoinPriceData;
    } catch (_) {
       final bitcoinPriceData = BitcoinPriceData.fromJson(response.data);
      return bitcoinPriceData;
    }
  }
}