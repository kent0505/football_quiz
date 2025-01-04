part of 'coins_bloc.dart';

@immutable
sealed class CoinsState {}

final class CoinsInitial extends CoinsState {}

final class CoinsLoaded extends CoinsState {
  CoinsLoaded({
    required this.coins,
    required this.stars,
    required this.hints,
    required this.quizes,
    this.onboard = false,
  });

  final int coins;
  final int stars;
  final int hints;
  final List<Quiz> quizes;
  final bool onboard;
}
