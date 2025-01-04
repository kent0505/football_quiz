import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/quiz.dart';
import '../utils.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  CoinsBloc() : super(CoinsInitial()) {
    on<LoadCoins>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      int coins = prefs.getInt('coins') ?? 100;
      int stars = prefs.getInt('stars') ?? 100;
      int hints = prefs.getInt('hints') ?? 1000;
      int ads = prefs.getInt('ads') ?? 1;
      bool onboard = prefs.getBool('onboard') ?? true;

      List<Quiz> quizes = await getQuizes();

      emit(CoinsLoaded(
        coins: coins,
        stars: stars,
        hints: hints,
        ads: ads,
        quizes: quizes,
        onboard: onboard,
      ));
    });

    on<BuyHints>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      int coins = prefs.getInt('coins') ?? 100;
      int stars = prefs.getInt('stars') ?? 100;
      int hints = prefs.getInt('hints') ?? 1000;
      int ads = prefs.getInt('ads') ?? 1;

      List<Quiz> quizes = await getQuizes();

      hints += 1;
      coins -= 50;

      await prefs.setInt('hints', hints);
      await prefs.setInt('coins', coins);

      emit(CoinsLoaded(
        coins: coins,
        stars: stars,
        hints: hints,
        ads: ads,
        quizes: quizes,
      ));
    });

    on<AddStars>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      int coins = prefs.getInt('coins') ?? 100;
      int stars = prefs.getInt('stars') ?? 100;
      int hints = prefs.getInt('hints') ?? 1000;
      int ads = prefs.getInt('ads') ?? 1;

      stars += 1;
      coins += 25;
      await prefs.setInt('stars', stars);
      await prefs.setInt('coins', coins);

      List<Quiz> quizes = await getQuizes();
      final quiz = quizes.firstWhere((quiz) => quiz.title == event.quiz.title);
      quiz.completed = true;
      quizes = await updateQuizes(quizes);

      emit(CoinsLoaded(
        coins: coins,
        stars: stars,
        hints: hints,
        ads: ads,
        quizes: quizes,
      ));
    });

    on<UseHint>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      int coins = prefs.getInt('coins') ?? 100;
      int stars = prefs.getInt('stars') ?? 100;
      int hints = prefs.getInt('hints') ?? 1000;
      int ads = prefs.getInt('ads') ?? 1;

      List<Quiz> quizes = await getQuizes();

      hints -= 1;
      await prefs.setInt('hints', hints);

      emit(CoinsLoaded(
        coins: coins,
        stars: stars,
        hints: hints,
        ads: ads,
        quizes: quizes,
      ));
    });

    on<ClearData>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      int coins = prefs.getInt('coins') ?? 100;
      int stars = prefs.getInt('stars') ?? 100;
      int hints = prefs.getInt('hints') ?? 1000;
      int ads = prefs.getInt('ads') ?? 1;

      for (Quiz quiz in quizesList) {
        quiz.completed = false;
      }

      List<Quiz> quizes = await updateQuizes(quizesList);

      emit(CoinsLoaded(
        coins: coins,
        stars: stars,
        hints: hints,
        ads: ads,
        quizes: quizes,
      ));
    });
  }
}
