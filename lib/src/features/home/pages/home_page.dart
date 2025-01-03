import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/level_card.dart';
import '../widgets/shop_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      home: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Appbar(
                home: true,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'Sport Quizzes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'w900',
                      ),
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        LevelCard(level: 1, lock: false),
                        LevelCard(level: 2),
                        LevelCard(level: 3),
                        LevelCard(level: 4),
                        LevelCard(level: 5),
                        LevelCard(level: 6),
                        LevelCard(level: 7),
                        LevelCard(level: 8),
                        LevelCard(level: 9),
                        LevelCard(level: 10),
                        LevelCard(level: 11),
                        LevelCard(level: 12),
                        LevelCard(level: 13),
                        LevelCard(level: 14),
                        LevelCard(level: 15),
                        LevelCard(level: 16),
                        LevelCard(level: 17),
                        LevelCard(level: 18),
                        LevelCard(level: 19),
                        LevelCard(level: 20),
                      ],
                    ),
                    SizedBox(height: 120),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 16,
            bottom: 40,
            child: ShopButton(),
          ),
        ],
      ),
    );
  }
}
