import 'package:flutter/material.dart';

import 'my_button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.width,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xff97E10A),
        borderRadius: BorderRadius.circular(52),
      ),
      child: MyButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xff011324),
              fontSize: 18,
              fontFamily: 'w700',
            ),
          ),
        ),
      ),
    );
  }
}
