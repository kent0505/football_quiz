import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: false,
  fontFamily: 'w700',
  scaffoldBackgroundColor: Color(0xff011324),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  ),
);

const cupertinoTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontFamily: 'w700',
      color: Colors.black,
    ),
  ),
);
