import 'package:flutter/material.dart';

import 'my_button.dart';

class LetterButton extends StatelessWidget {
  const LetterButton({
    super.key,
    required this.letter,
    required this.selected,
    this.height = 48,
    required this.onPressed,
  });

  final String letter;
  final bool selected;
  final double height;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: selected ? null : onPressed,
      minSize: height,
      child: Container(
        height: height,
        width: height,
        decoration: BoxDecoration(
          color: selected ? Colors.transparent : Color(0xff098CF1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            letter,
            style: TextStyle(
              color: selected ? Colors.transparent : Colors.white,
              fontSize: 24,
              fontFamily: 'w900',
            ),
          ),
        ),
      ),
    );
  }
}
