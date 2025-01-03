part of 'coins_bloc.dart';

@immutable
sealed class CoinsEvent {}

class LoadCoins extends CoinsEvent {}

class BuyHints extends CoinsEvent {}

class AddStars extends CoinsEvent {}

class UseHint extends CoinsEvent {}
