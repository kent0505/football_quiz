part of 'coins_bloc.dart';

@immutable
sealed class CoinsEvent {}

class LoadCoins extends CoinsEvent {}

class BuyHints extends CoinsEvent {}

class AddStars extends CoinsEvent {
  AddStars({required this.quiz});
  final Quiz quiz;
}

class UseHint extends CoinsEvent {}

class ClearData extends CoinsEvent {}
