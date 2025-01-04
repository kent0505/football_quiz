import 'package:flutter/material.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({
    super.key,
    required this.selected,
    required this.win,
  });

  final String selected;
  final bool win;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: selected.isEmpty
            ? Color(0xff0E2438)
            : win
                ? Color(0xff97E10A)
                : Color(0xff098CF1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          selected,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'w700',
          ),
        ),
      ),
    );
  }
}
