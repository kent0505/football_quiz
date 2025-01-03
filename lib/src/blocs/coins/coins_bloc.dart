import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  CoinsBloc() : super(CoinsInitial()) {
    on<LoadCoins>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      int coins = prefs.getInt('coins') ?? 100;
      int stars = prefs.getInt('stars') ?? 0;
      int hints = prefs.getInt('hints') ?? 10;
      bool onboard = prefs.getBool('onboard') ?? true;
      emit(CoinsLoaded(
        coins: coins,
        stars: stars,
        hints: hints,
        onboard: onboard,
      ));
    });

    on<BuyHints>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      int coins = prefs.getInt('coins') ?? 100;
      int stars = prefs.getInt('stars') ?? 0;
      int hints = prefs.getInt('hints') ?? 10;
      hints += 1;
      coins -= 50;
      await prefs.setInt('hints', hints);
      await prefs.setInt('coins', coins);
      emit(CoinsLoaded(
        coins: coins,
        stars: stars,
        hints: hints,
      ));
    });

    on<AddStars>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      int coins = prefs.getInt('coins') ?? 100;
      int stars = prefs.getInt('stars') ?? 0;
      int hints = prefs.getInt('hints') ?? 10;
      stars += 1;
      await prefs.setInt('stars', stars);
      emit(CoinsLoaded(
        coins: coins,
        stars: stars,
        hints: hints,
      ));
    });

    on<UseHint>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      int coins = prefs.getInt('coins') ?? 100;
      int stars = prefs.getInt('stars') ?? 0;
      int hints = prefs.getInt('hints') ?? 10;
      hints -= 1;
      await prefs.setInt('hints', hints);
      emit(CoinsLoaded(
        coins: coins,
        stars: stars,
        hints: hints,
      ));
    });
  }
}
