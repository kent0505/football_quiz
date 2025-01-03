import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/my_button.dart';
import '../../../core/widgets/others/svg_widget.dart';
import '../pages/level_page.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    super.key,
    required this.level,
    this.lock = true,
  });

  final int level;
  final bool lock;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: lock
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LevelPage(level: level);
                  },
                ),
              );
            },
      child: Opacity(
        opacity: lock ? 0.5 : 1,
        child: Container(
          height: 80,
          width: getWidth(context) / 2 - 20,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: Color(0xff0E2438),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Row(
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
                                '16',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'w500',
                                ),
                              ),
                            ],
                          )
                        else
                          Text(
                            '5/16',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'w500',
                            ),
                          ),
                      ],
                    ),
                  ),
                  SvgWidget('assets/arrow-right.svg'),
                ],
              ),
              if (lock)
                Center(
                  child: SvgWidget('assets/lock.svg'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
