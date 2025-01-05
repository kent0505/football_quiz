import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_quiz/widgets/ads_card.dart';

import '../coins/coins_bloc.dart';
import '../pages/settings_page.dart';
import 'c_button.dart';
import 'svg_widget.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
    this.title = '',
    this.home = false,
  });

  final String title;
  final bool home;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Row(
        children: [
          SizedBox(width: 16),
          CButton(
            onPressed: () {
              home
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SettingsPage();
                        },
                      ),
                    )
                  : Navigator.pop(context);
            },
            minSize: 44,
            child: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff0E2438),
              ),
              child: Center(
                child: SvgWidget(
                  home ? 'assets/settings.svg' : 'assets/back.svg',
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'w700',
            ),
          ),
          Spacer(),
          CButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Color(0xff0E2438),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                builder: (context) {
                  return SizedBox(
                    height: 510,
                    child: Column(
                      children: [
                        SizedBox(height: 8),
                        Container(
                          height: 5,
                          width: 36,
                          decoration: BoxDecoration(
                            color: Color(0xff3d3d3d).withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            SizedBox(width: 16),
                            Text(
                              'Take more money',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'w700',
                              ),
                            ),
                            Spacer(),
                            CButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close_rounded,
                                color: Color(0xff97E10A),
                                weight: 2,
                                size: 26,
                              ),
                            ),
                            SizedBox(width: 16),
                          ],
                        ),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            children: [
                              SizedBox(height: 24),
                              AdsCard(id: 1, amount: 200),
                              SizedBox(height: 8),
                              AdsCard(id: 2, amount: 200 * 2),
                              SizedBox(height: 8),
                              AdsCard(id: 3, amount: 200 * 3),
                              SizedBox(height: 8),
                              AdsCard(id: 4, amount: 200 * 4),
                              SizedBox(height: 8),
                              AdsCard(id: 5, amount: 200 * 5),
                              SizedBox(height: 8),
                              AdsCard(id: 6, amount: 200 * 6),
                              SizedBox(height: 8),
                              AdsCard(id: 7, amount: 200 * 7),
                              SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            minSize: 44,
            child: Container(
              height: 44,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xff0E2438),
                borderRadius: BorderRadius.circular(44),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12),
                  SvgWidget('assets/coin.svg'),
                  Spacer(),
                  BlocBuilder<CoinsBloc, CoinsState>(
                    builder: (context, state) {
                      if (state is CoinsLoaded) {
                        return Text(
                          state.coins.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'w700',
                          ),
                        );
                      }

                      return Container();
                    },
                  ),
                  Spacer(),
                  SvgWidget('assets/add.svg'),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            height: 44,
            width: 74,
            decoration: BoxDecoration(
              color: Color(0xff098CF1),
              borderRadius: BorderRadius.circular(44),
            ),
            child: Row(
              children: [
                SizedBox(width: 12),
                SvgWidget('assets/star.svg'),
                Spacer(),
                BlocBuilder<CoinsBloc, CoinsState>(
                  builder: (context, state) {
                    if (state is CoinsLoaded) {
                      return Text(
                        state.stars.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
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
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
