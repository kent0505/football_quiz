import 'package:flutter/material.dart';

import 'my_button.dart';

class LetterButton extends StatelessWidget {
  const LetterButton({
    super.key,
    required this.letter,
    required this.selected,
    required this.onPressed,
  });

  final String letter;
  final bool selected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: selected ? null : onPressed,
      child: Container(
        height: 48,
        width: 48,
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
