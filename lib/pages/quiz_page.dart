import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../coins/coins_bloc.dart';
import '../models/quiz.dart';
import '../utils.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/field_card.dart';
import '../widgets/letter_button.dart';
import '../widgets/main_button.dart';
import '../widgets/quiz_bottom_buttons.dart';
import '../widgets/win_data.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.quiz});

  final Quiz quiz;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Quiz quiz;
  String selected = '';
  List<int> selectedIndexes = [];
  bool win = false;

  void onClear() {
    if (selected.isNotEmpty) {
      setState(() {
        selected = '';
        selectedIndexes = [];
      });
    }
  }

  void onDel() {
    if (selected.isNotEmpty) {
      setState(() {
        selectedIndexes.removeLast();
        selected = selected.substring(0, selected.length - 1);
      });
    }
  }

  void onHint() {
    if (selected.length < quiz.title.length) {
      for (int i = 0; i < quiz.letters.length; i++) {
        if (quiz.letters[i] == quiz.title[selected.length].toUpperCase()) {
          selectLetter(quiz.title[selected.length].toUpperCase(), i);
          context.read<CoinsBloc>().add(UseHint());
          break;
        }
      }
    }
  }

  void selectLetter(String value, int index) {
    if (selected.length < quiz.title.length) {
      selectedIndexes.add(index);
      selected += value;
      check();
    }
  }

  void check() {
    setState(() {
      if (selected.toLowerCase() == quiz.title.toLowerCase()) {
        if (!quiz.completed) {
          context.read<CoinsBloc>().add(AddStars(quiz: quiz));
        }
        win = true;
      }
    });
  }

  void onNext(List<Quiz> quizes) {
    setState(() {
      int index = quizes.indexWhere((q) => q.title == quiz.title);
      if (index + 1 < quizes.length) {
        quiz = quizes[index + 1];
        quiz.letters.shuffle();
        selected = '';
        selectedIndexes = [];
        win = false;
      } else {
        Navigator.pop(context);
      }
    });
  }

  String getSelected(int index) {
    if (selected.length <= index) return '';
    return selected[index].toUpperCase();
  }

  @override
  void initState() {
    super.initState();
    quiz = widget.quiz;
    quiz.letters.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Appbar(title: addZero(quiz.level)),
          SizedBox(height: 8),
          Container(
            height: 358,
            width: 358,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Color(0xff0E2438),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Center(
              child: Image.asset(quiz.asset),
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                quiz.title.length,
                (index) => FieldCard(
                  selected: getSelected(index),
                  win: win,
                ),
              ),
            ),
          ),
          Spacer(),
          if (win)
            WinData(quiz: quiz)
          else ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  quiz.letters.length,
                  (index) => LetterButton(
                    letter: quiz.letters[index],
                    selected: selectedIndexes.contains(index),
                    height: quiz.letters.length > 16 ? 34 : 42,
                    onPressed: () {
                      selectLetter(quiz.letters[index], index);
                    },
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
          if (win)
            BlocBuilder<CoinsBloc, CoinsState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 44),
                  child: MainButton(
                    title: 'Next',
                    onPressed: () {
                      onNext(state is CoinsLoaded
                          ? getQuizesByLevel(state.quizes, quiz.level)
                          : []);
                    },
                  ),
                );
              },
            )
          else
            QuizBottomButtons(
              onClear: onClear,
              onDel: onDel,
              onHint: onHint,
            ),
        ],
      ),
    );
  }
}
