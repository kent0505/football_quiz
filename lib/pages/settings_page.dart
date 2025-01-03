import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/my_button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/dialog_widget.dart';
import '../widgets/svg_widget.dart';
import 'splash_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(height: 8 + MediaQuery.of(context).viewPadding.top),
          Row(
            children: [
              SizedBox(width: 16),
              MyButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                minSize: 44,
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff0E2438),
                  ),
                  child: Center(
                    child: SvgWidget('assets/back.svg'),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'w700',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 60),
            ],
          ),
          SizedBox(height: 16),
          _Button(
            title: 'Notifications',
            onPressed: () {},
          ),
          SizedBox(height: 8),
          _Button(
            title: 'Privacy Policy',
            onPressed: () {},
          ),
          SizedBox(height: 8),
          _Button(
            title: 'Terms of Use',
            onPressed: () {},
          ),
          SizedBox(height: 8),
          _Button(
            title: 'Share App',
            onPressed: () {},
          ),
          SizedBox(height: 8),
          _Button(
            title: 'Rate Us',
            onPressed: () {},
          ),
          SizedBox(height: 8),
          _Button(
            title: 'Clear Data',
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return DialogWidget(
                    title: 'Clear Data',
                    description:
                        'Do you really want to clear all data? This action will reset your settings and is irreversible.',
                    onYes: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.clear();
                      if (context.mounted) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SplashPage();
                            },
                          ),
                          (route) => false,
                        );
                      }
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: onPressed,
      child: Container(
        height: 52,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xff0E2438),
          borderRadius: BorderRadius.circular(52),
        ),
        child: Row(
          children: [
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'w700',
              ),
            ),
            Spacer(),
            SvgWidget('assets/arrow-right.svg'),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
