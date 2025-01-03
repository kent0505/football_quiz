import 'package:flutter/material.dart';

import '../../../core/models/quiz.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/my_button.dart';
import '../pages/quiz_page.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.quiz,
  });

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return QuizPage(quiz: quiz);
            },
          ),
        );
      },
      child: Container(
        height: getWidth(context) / 2 - 20,
        width: getWidth(context) / 2 - 20,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Color(0xff0E2438),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(
          child: Image.asset(
            quiz.asset,
          ),
        ),
      ),
    );
  }
}
