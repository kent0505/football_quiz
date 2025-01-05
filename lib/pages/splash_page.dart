import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../coins/coins_bloc.dart';
import '../widgets/loading.dart';
import 'home_page.dart';
import 'onboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<CoinsBloc>().add(LoadCoins());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CoinsBloc, CoinsState>(
      listener: (context, state) {
        Future.delayed(
          const Duration(seconds: 2),
          () {
            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return state is CoinsLoaded && state.onboard
                        ? OnboardPage()
                        : HomePage();
                  },
                ),
                (route) => false,
              );
            }
          },
        );
      },
      child: Scaffold(
        body: Center(
          child: Loading(),
        ),
      ),
    );
  }
}
