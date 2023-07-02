import 'package:flutter/material.dart';

import 'Widgets/appBarXo.dart';
import 'Widgets/navigatorButtonXO.dart';
import 'Widgets/textXO.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBarXo(context, title: 'TIC TAC TOE'),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [textXO(title: 'X'), textXO(title: 'O')],
              ),
            ),
            Column(
              children: [
                navigatorButtonXO(
                  context,
                  title: 'One Player',
                  route: 'OnePlayerScreen',
                ),
                navigatorButtonXO(
                  context,
                  title: 'Two Player',
                  route: 'TwoPlayerScreen',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
