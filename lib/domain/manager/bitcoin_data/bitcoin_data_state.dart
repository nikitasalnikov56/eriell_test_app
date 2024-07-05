part of 'bitcoin_data_bloc.dart';

@immutable
sealed class BitcoinDataState {}

final class BitcoinDataInitial extends BitcoinDataState {}
final class BitcoinDataLoadingState extends BitcoinDataState {}

final class BitcoinDataLoadedState extends BitcoinDataState {
  final BitcoinPriceData? bitcoinPriceData;
  final Map<String, double> dataMap;
  BitcoinDataLoadedState({required this.bitcoinPriceData, required this.dataMap});
}

final class BitcoinDataErrorState extends BitcoinDataState {
  final String errorMessage;
  BitcoinDataErrorState({required this.errorMessage});
}