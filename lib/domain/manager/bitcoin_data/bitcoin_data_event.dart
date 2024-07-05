part of 'bitcoin_data_bloc.dart';

@immutable
sealed class BitcoinDataEvent {}

class BitcoinDataLoadEvent extends BitcoinDataEvent{}
