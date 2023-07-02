import 'package:flutter/material.dart';
import 'package:my_apps/twoplayer_game.dart';
import 'package:my_apps/twoplayer_screen.dart';
import 'package:provider/provider.dart';
import 'mainPage.dart';
import 'models.dart';
import 'oneplayer_game.dart';
import 'oneplayer_screen.dart';
import 'splash_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => WidgetesXO(),
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          labelLarge: TextStyle(
              fontFamily: 'CarterOne', fontSize: 20, color: Colors.white),
          labelMedium: TextStyle(
              fontFamily: 'CarterOne', fontSize: 18, color: Colors.white),
        ),
        primaryColor: const Color.fromRGBO(54, 36, 141, 1),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        'MainPage': (context) => const MainPage(),
        'OnePlayerScreen': (context) => const OnePlayerScreen(),
        'OnePlayerGame': (context) => const OnePlayerGame(),
        'TwoPlayerScreen': (context) => const TwoPlayerScreen(),
        'twoplayerGame': (context) => const TwoPlayerGame(),
      },
    );
  }
}
