import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../coins/coins_bloc.dart';
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
                BlocBuilder<CoinsBloc, CoinsState>(
                  builder: (context, state) {
                    if (state is CoinsLoaded) {
                      final quizes = getQuizesByLevel(state.quizes, level);

                      return Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(
                          quizes.length,
                          (index) => QuizCard(quiz: quizes[index]),
                        ),
                      );
                    }

                    return Container();
                  },
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
