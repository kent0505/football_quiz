import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/internet/internet_bloc.dart';
import 'buttons/main_button.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.home = false,
  });

  final Widget body;
  final bool home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetFailure) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ooops...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'w700',
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'It seems you\'re offline right now. Press the Retry button below to reconnect, and we\'ll try to restore your connection.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffA6A6A6),
                      fontSize: 14,
                      fontFamily: 'w500',
                    ),
                  ),
                ),
                SizedBox(height: 16),
                MainButton(
                  title: 'Retry',
                  width: 180,
                  onPressed: () {},
                ),
              ],
            );
          }

          return body;
        },
      ),
    );
  }
}
