import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../coins/coins_bloc.dart';
import 'my_button.dart';
import 'svg_widget.dart';

class AdsCard extends StatelessWidget {
  const AdsCard({
    super.key,
    required this.id,
    required this.amount,
  });

  final int id;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinsBloc, CoinsState>(
      builder: (context, state) {
        final lock = state is CoinsLoaded && state.ads < id;

        return MyButton(
          onPressed: lock ? null : () {},
          child: SizedBox(
            height: 52,
            child: Stack(
              children: [
                Opacity(
                  opacity: lock ? 0.5 : 1,
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: Color(0xff132D47),
                      borderRadius: BorderRadius.circular(52),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff000C17).withValues(alpha: 0.5),
                          blurRadius: 12,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        SvgWidget('assets/coin.svg'),
                        SizedBox(width: 4),
                        Text(
                          amount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'w700',
                          ),
                        ),
                        Spacer(),
                        Text(
                          'for $id adv',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'w700',
                          ),
                        ),
                        SizedBox(width: 8),
                        SvgWidget('assets/ads.svg'),
                        SizedBox(width: 16),
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
