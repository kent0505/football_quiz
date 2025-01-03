import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils.dart';
import '../../core/widgets/buttons/main_button.dart';
import '../../core/widgets/others/svg_widget.dart';
import '../home/pages/home_page.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  void onNext() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboard', false);

    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: SvgWidget('assets/onboard.svg'),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 10 + getStatusBar(context)),
              Text(
                'Welcome to Our App!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'w900',
                ),
              ),
              Spacer(),
              MainButton(
                title: 'Let’s Get Started!',
                onPressed: onNext,
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
