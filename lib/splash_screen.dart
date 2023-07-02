import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'Widgets/textXO.dart';
import 'models.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<WidgetesXO>().getPrefs();

    Future.delayed(const Duration(seconds: 4),
        () => Navigator.of(context).pushReplacementNamed('MainPage'));
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Lottie.asset('animations/74547-games-icon.json',
                animate: true, repeat: false),
          ),
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(const Duration(seconds: 2), () {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textXO(
                        title: 'X',
                        size: MediaQuery.of(context).size.width * .5),
                    textXO(
                        title: 'O',
                        size: MediaQuery.of(context).size.width * .5),
                  ],
                );
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data as Widget;
                } else
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textXO(
                          title: 'X',
                          size: MediaQuery.of(context).size.width * .5,
                          opacity: 0),
                      textXO(
                          title: 'O',
                          size: MediaQuery.of(context).size.width * .5,
                          opacity: 0),
                    ],
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}
