

import 'package:eriell_app/domain/api/api.dart';
import 'package:eriell_app/domain/model/bitcoin_price_data.dart';

class RepositoryData{
  Future<BitcoinPriceData> getAllData() => Api.getBitcoinPriceData();
}