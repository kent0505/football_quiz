import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../coins/coins_bloc.dart';
import '../models/quiz.dart';
import 'svg_widget.dart';

class WinData extends StatelessWidget {
  const WinData({super.key, required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 32,
                width: 168,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 24,
                        width: 154,
                        decoration: BoxDecoration(
                          color: Color(0xff0E2438),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: BlocBuilder<CoinsBloc, CoinsState>(
                        builder: (context, state) {
                          if (state is CoinsLoaded) {
                            int index = state.quizes.indexWhere((q) {
                                  return q.title == quiz.title;
                                }) +
                                1;

                            return Container(
                              height: 24,
                              width: 154 / 8 * index,
                              decoration: BoxDecoration(
                                color: Color(0xff098CF1),
                                borderRadius: BorderRadius.circular(24),
                              ),
                            );
                          }

                          return Container();
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: SvgWidget('assets/star.svg', height: 32),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              BlocBuilder<CoinsBloc, CoinsState>(
                builder: (context, state) {
                  if (state is CoinsLoaded) {
                    return Text(
                      '${state.stars}/8',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'w700',
                      ),
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            height: 48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff011324).withValues(alpha: 0.4),
                  Color(0xff098CF1).withValues(alpha: 0.5),
                  Color(0xff011324).withValues(alpha: 0.4),
                ],
              ),
            ),
            child: Row(
              children: [
                Spacer(),
                SvgWidget('assets/star.svg', height: 32),
                SizedBox(width: 10),
                BlocBuilder<CoinsBloc, CoinsState>(
                  builder: (context, state) {
                    if (state is CoinsLoaded) {
                      int stars = state.stars;

                      return Text(
                        '${8 - stars} to unlock level ${quiz.level + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'w700',
                        ),
                      );
                    }

                    return Container();
                  },
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
