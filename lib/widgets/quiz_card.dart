import 'package:flutter/material.dart';

import '../models/quiz.dart';
import 'c_button.dart';
import '../pages/quiz_page.dart';
import 'svg_widget.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.quiz,
  });

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width / 2 - 20;

    return CButton(
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
      child: SizedBox(
        height: height,
        width: height,
        child: Stack(
          children: [
            Opacity(
              opacity: quiz.completed ? 0.5 : 1,
              child: Container(
                height: height,
                width: height,
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
            ),
            if (quiz.completed)
              Center(
                child: SvgWidget('assets/done.svg'),
              ),
          ],
        ),
      ),
    );
  }
}
