import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../coins/coins_bloc.dart';
import 'my_button.dart';
import 'dialog_widget.dart';
import 'svg_widget.dart';

class HintCard extends StatelessWidget {
  const HintCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinsBloc, CoinsState>(
      builder: (context, state) {
        return MyButton(
          onPressed: () async {
            if (state is CoinsLoaded && state.coins >= 50) {
              context.read<CoinsBloc>().add(BuyHints());
            } else {
              if (context.mounted) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogWidget(
                      title: 'Not enough coins',
                      description:
                          'Not enough money to purchase a hint. Watch an ad to earn additional funds.',
                      onlyClose: true,
                      onYes: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              }
            }
          },
          child: Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xff132D47),
              borderRadius: BorderRadius.circular(52),
            ),
            child: Row(
              children: [
                SizedBox(width: 16),
                SvgWidget('assets/hint.svg'),
                SizedBox(width: 8),
                Text(
                  '1 hint',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'w700',
                  ),
                ),
                Spacer(),
                Text(
                  '50',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'w700',
                  ),
                ),
                SizedBox(width: 4),
                SvgWidget('assets/coin.svg'),
                SizedBox(width: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
