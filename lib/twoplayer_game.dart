import 'dart:math';

import 'package:flutter/material.dart';
import 'Widgets/appBarXo.dart';
import 'Widgets/playerCardGameTwo.dart';
import 'Widgets/twoPlayerDrawCardnewMethod.dart';
import 'Widgets/twoPlayerGridBulider.dart';

class TwoPlayerGame extends StatelessWidget {
  const TwoPlayerGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBarXo(context, title: 'Game'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(235, 23, 81, 1),
                    Color.fromRGBO(235, 23, 81, .05)
                  ]),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(child: playerCardGameTwo(context, id: 'Player 1')),
                  Expanded(child: twoPlayerDrawCardnewMethod()),
                ],
              ),
            ),
            twoPlayerGridBulider(context),
            Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(255, 208, 50, 0.05),
                    Color.fromRGBO(255, 208, 50, 1),
                  ]),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.all(8),
              child: Transform.rotate(
                angle: pi,
                child: Row(
                  children: [
                    Expanded(child: playerCardGameTwo(context, id: 'Player 2')),
                    Expanded(child: twoPlayerDrawCardnewMethod()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
