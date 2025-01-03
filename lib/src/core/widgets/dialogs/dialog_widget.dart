import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buttons/main_button.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.title,
    required this.description,
    this.onlyClose = false,
    required this.onYes,
  });

  final String title;
  final String description;
  final bool onlyClose;
  final void Function() onYes;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff0E2438),
      child: SizedBox(
        height: 172,
        width: 358,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'w700',
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'w500',
                ),
              ),
            ),
            Spacer(),
            if (onlyClose)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MainButton(
                  title: 'Okay',
                  onPressed: onYes,
                ),
              )
            else
              Row(
                children: [
                  const SizedBox(width: 25),
                  Expanded(
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(52),
                      ),
                      child: CupertinoButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.zero,
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'w700',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Color(0xff97E10A),
                        borderRadius: BorderRadius.circular(52),
                      ),
                      child: CupertinoButton(
                        onPressed: onYes,
                        padding: EdgeInsets.zero,
                        child: Center(
                          child: Text(
                            'Clear',
                            style: const TextStyle(
                              color: Color(0xff011324),
                              fontSize: 18,
                              fontFamily: 'w700',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                ],
              ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
