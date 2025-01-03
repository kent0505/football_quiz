import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../coins/coins_bloc.dart';
import 'dialog_widget.dart';
import 'my_button.dart';
import 'svg_widget.dart';

class QuizBottomButtons extends StatelessWidget {
  const QuizBottomButtons({
    super.key,
    required this.onClear,
    required this.onDel,
    required this.onHint,
  });

  final void Function() onClear;
  final void Function() onDel;
  final void Function() onHint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Color(0xff132D47),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(width: 32),
              _Button(
                asset: 'assets/x.svg',
                onPressed: onClear,
              ),
              Spacer(),
              _Button(
                asset: 'assets/del.svg',
                onPressed: onDel,
              ),
              Spacer(),
              BlocBuilder<CoinsBloc, CoinsState>(
                builder: (context, state) {
                  if (state is CoinsLoaded) {
                    return MyButton(
                      onPressed: () {
                        if (state.hints >= 1) {
                          context.read<CoinsBloc>().add(UseHint());
                          onHint();
                        } else {
                          if (state.coins >= 50) {
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
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff97E10A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: SvgWidget('assets/hint2.svg'),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
              SizedBox(width: 32),
            ],
          ),
          Positioned(
            top: 40,
            right: 16,
            child: BlocBuilder<CoinsBloc, CoinsState>(
              builder: (context, state) {
                if (state is CoinsLoaded) {
                  return SizedBox(
                    width: state.hints >= 1 ? 40 : 50,
                    child: Stack(
                      children: [
                        SvgWidget('assets/hint3.svg'),
                        Positioned(
                          right: 0,
                          child: Container(
                            height: 18,
                            width: state.hints >= 1 ? 32 : 42,
                            decoration: BoxDecoration(
                              color: Color(0xff098CF1),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(18),
                                bottomRight: Radius.circular(18),
                              ),
                            ),
                          ),
                        ),
                        state.hints >= 1
                            ? Positioned(
                                top: 1,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Text(
                                    state.hints.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'w500',
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                children: [
                                  SizedBox(width: 8),
                                  SvgWidget(
                                    'assets/coin.svg',
                                    height: 18,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    '50',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'w500',
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  );
                }

                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.asset,
    required this.onPressed,
  });

  final String asset;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: onPressed,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Color(0xff098CF1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: SvgWidget(asset),
        ),
      ),
    );
  }
}
