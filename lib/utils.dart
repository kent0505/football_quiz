import 'dart:developer' as developer;

import 'package:flutter/material.dart';

double navbarHeight = 70;

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

String addZero(int value) {
  return 'Level ${value.toString().padLeft(2, '0')}';
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

void logger(Object message) => developer.log(message.toString());

void precacheImages(BuildContext context) {
  List<String> imageAssets = [
    // 'assets/.png',
  ];
  try {
    for (String assets in imageAssets) {
      precacheImage(AssetImage(assets), context);
    }
  } catch (e) {
    logger(e);
  }
}
