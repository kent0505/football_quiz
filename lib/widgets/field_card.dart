import 'package:flutter/material.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({
    super.key,
    required this.selected,
  });

  final String selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: selected.isEmpty ? Color(0xff0E2438) : Color(0xff098CF1),
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
