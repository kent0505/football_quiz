import 'package:flutter/material.dart';

import '../models/quiz.dart';
import '../utils.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/quiz_card.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({
    super.key,
    required this.level,
  });

  final int level;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Appbar(title: addZero(level)),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    quizesList.length,
                    (index) => QuizCard(quiz: quizesList[index]),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
