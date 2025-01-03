import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/blocs/coins/coins_bloc.dart';
import 'src/core/config/themes.dart';
import 'src/blocs/internet/internet_bloc.dart';
import 'src/features/splash/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // precacheImages(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InternetBloc()..add(CheckInternet())),
        BlocProvider(create: (context) => CoinsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: theme,
        home: SplashPage(),
      ),
    );
  }
}
