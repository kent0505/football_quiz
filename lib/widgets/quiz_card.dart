import 'package:flutter/material.dart';

import '../models/quiz.dart';
import 'my_button.dart';
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
        height: MediaQuery.of(context).size.width / 2 - 20,
        width: MediaQuery.of(context).size.width / 2 - 20,
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
