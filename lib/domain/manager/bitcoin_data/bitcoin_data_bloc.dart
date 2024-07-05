import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:eriell_app/domain/api/api.dart';
import 'package:eriell_app/domain/api/repository_data.dart';
import 'package:eriell_app/domain/model/bitcoin_price_data.dart';
import 'package:meta/meta.dart';


part 'bitcoin_data_event.dart';
part 'bitcoin_data_state.dart';

class BitcoinDataBloc extends Bloc<BitcoinDataEvent, BitcoinDataState> {
  final RepositoryData repositoryData;
  BitcoinDataBloc({required this.repositoryData})
      : super(BitcoinDataInitial()) {
    on<BitcoinDataLoadEvent>(_getBitcoinData);
  }

  Future<void> _getBitcoinData(event, emit) async {
    emit(BitcoinDataLoadingState());

    try {
      final BitcoinPriceData bitcoinPriceData = await Api.getBitcoinPriceData();
      emit(
        BitcoinDataLoadedState(
          bitcoinPriceData: bitcoinPriceData,
          dataMap: {
            '${bitcoinPriceData.bpi?.uSD?.code}': bitcoinPriceData.bpi?.uSD?.rateFloat,
            '${bitcoinPriceData.bpi?.gBP?.code}': bitcoinPriceData.bpi?.gBP?.rateFloat,
            '${bitcoinPriceData.bpi?.eUR?.code}': bitcoinPriceData.bpi?.eUR?.rateFloat,
          },
        ),
      );
    } catch (e) {
      emit(BitcoinDataErrorState(errorMessage: e.toString()));
    }
  }
}
