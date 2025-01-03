import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../coins/coins_bloc.dart';
import '../models/quiz.dart';
import '../utils.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/field_card.dart';
import '../widgets/letter_button.dart';
import '../widgets/quiz_bottom_buttons.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
    required this.quiz,
  });

  final Quiz quiz;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String selected = '';
  List<int> selectedIndexes = [];

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
    if (selected.length < widget.quiz.title.length) {
      context.read<CoinsBloc>().add(UseHint());
      setState(() {
        //
      });
    }
  }

  void selectLetter(String value, int index) {
    if (selected.length < widget.quiz.title.length) {
      setState(() {
        selectedIndexes.add(index);
        selected += value;
      });
    }
  }

  String getSelected(int index) {
    if (selected.length <= index) return '';
    return selected[index].toUpperCase();
  }

  @override
  void initState() {
    super.initState();
    widget.quiz.letters.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Appbar(title: addZero(widget.quiz.level)),
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
              child: Image.asset(widget.quiz.asset),
            ),
          ),
          Spacer(),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              widget.quiz.title.length,
              (index) => FieldCard(selected: getSelected(index)),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 48 * 6 + 8 * 5,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                widget.quiz.letters.length,
                (index) => LetterButton(
                  letter: widget.quiz.letters[index],
                  selected: selectedIndexes.contains(index),
                  onPressed: () {
                    selectLetter(widget.quiz.letters[index], index);
                  },
                ),
              ),
            ),
          ),
          Spacer(),
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
