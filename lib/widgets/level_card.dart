import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../coins/coins_bloc.dart';
import '../pages/level_page.dart';
import 'my_button.dart';
import 'svg_widget.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    super.key,
    required this.level,
    required this.stars,
  });

  final int level;
  final int stars;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinsBloc, CoinsState>(
      builder: (context, state) {
        final lock = state is CoinsLoaded && state.stars < stars;

        return MyButton(
          onPressed: lock
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LevelPage(level: level),
                    ),
                  );
                },
          child: SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: Stack(
              children: [
                Opacity(
                  opacity: lock ? 0.5 : 1,
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff0E2438),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Level ${level.toString().padLeft(2, '0')}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'w700',
                                ),
                              ),
                              if (lock)
                                Row(
                                  children: [
                                    SvgWidget('assets/star.svg'),
                                    SizedBox(width: 6),
                                    Text(
                                      stars.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'w500',
                                      ),
                                    ),
                                  ],
                                )
                              else
                                BlocBuilder<CoinsBloc, CoinsState>(
                                  builder: (context, state) {
                                    if (state is CoinsLoaded) {
                                      return Text(
                                        '${state.quizes.where((quiz) => quiz.level == level && quiz.completed).length}/8',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'w500',
                                        ),
                                      );
                                    }

                                    return Container();
                                  },
                                ),
                            ],
                          ),
                        ),
                        SvgWidget('assets/arrow-right.svg'),
                      ],
                    ),
                  ),
                ),
                if (lock)
                  Center(
                    child: SvgWidget('assets/lock.svg'),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
