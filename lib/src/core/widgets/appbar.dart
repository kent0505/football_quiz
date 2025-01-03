import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/coins/coins_bloc.dart';
import '../../features/home/pages/settings_page.dart';
import '../utils.dart';
import 'buttons/my_button.dart';
import 'others/svg_widget.dart';

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
      margin: EdgeInsets.only(top: getStatusBar(context)),
      child: BlocBuilder<CoinsBloc, CoinsState>(
        builder: (context, state) {
          return Row(
            children: [
              SizedBox(width: 16),
              MyButton(
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
              MyButton(
                onPressed: () {},
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
                      Text(
                        '${state is CoinsLoaded ? state.coins.toString() : 0}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'w700',
                        ),
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
                    Text(
                      '${state is CoinsLoaded ? state.stars.toString() : 0}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'w700',
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(width: 16),
            ],
          );
        },
      ),
    );
  }
}
