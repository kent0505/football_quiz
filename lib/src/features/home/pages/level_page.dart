import 'package:flutter/material.dart';

import '../../../core/models/quiz.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
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
          Appbar(title: 'Level ${level.toString().padLeft(2, '0')}'),
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
                    (index) {
                      return QuizCard(quiz: quizesList[index]);
                    },
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
