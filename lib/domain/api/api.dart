import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:eriell_app/domain/model/bitcoin_price_data.dart';

class Api {
  static final dio = Dio();

  // Настройка HTTP-клиента для игнорирования ошибок сертификатов
  static void setupHttpClient() {
    // dio.httpClientAdapter - Это свойство объекта Dio, которое используется для установки адаптера HTTP-клиента.
    //Адаптер позволяет настроить, как Dio выполняет HTTP-запросы. В данном случае мы используем IOHttpClientAdapter.
    dio.httpClientAdapter = IOHttpClientAdapter(
      //IOHttpClientAdapter - Это адаптер для Dio, который использует dart:io для выполнения HTTP-запросов.
      // Он позволяет более гибко настраивать HTTP-клиент, включая работу с сертификатами.

      //createHttpClient - Это функция, которую мы передаем в IOHttpClientAdapter. 
      //Она возвращает настроенный экземпляр HttpClient. 
      //Эта функция вызывается адаптером для создания нового HTTP-клиента.
      createHttpClient: () {
        final client = HttpClient(); // Это класс из dart:io, который используется для выполнения HTTP-запросов. Он предоставляет методы для отправки запросов и обработки ответов.
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
            // client.badCertificateCallback: Это свойство объекта HttpClient, 
            //которое позволяет задать функцию обратного вызова для обработки недействительных сертификатов. 
            //Эта функция вызывается, когда клиент сталкивается с недействительным сертификатом. 
            //В данном случае функция всегда возвращает true, что означает, что все недействительные сертификаты будут приниматься.
        return client;
      },
    );
  }

  static Future<BitcoinPriceData> getBitcoinPriceData() async {
    setupHttpClient();
    final response =
        await dio.get('https://api.coindesk.com/v1/bpi/currentprice.json');

    try {
      final bitcoinPriceData = BitcoinPriceData.fromJson(response.data);
      return bitcoinPriceData;
    } catch (_) {
      final bitcoinPriceData = BitcoinPriceData.fromJson(response.data);
      return bitcoinPriceData;
    }
  }
}
