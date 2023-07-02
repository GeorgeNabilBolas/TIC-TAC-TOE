import 'package:flutter/material.dart';

import 'Widgets/appBarXo.dart';
import 'Widgets/onPlayerDrawCard.dart';
import 'Widgets/onePlayerGridBulider.dart';
import 'Widgets/playerCard.dart';
import 'Widgets/stateCardGame.dart';

class OnePlayerGame extends StatelessWidget {
  const OnePlayerGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBarXo(context, title: 'Game'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                playerCard(context, id: 'Player'),
                onPlayerDrawCard(),
                playerCard(context, id: 'Computer'),
              ],
            ),
            onePlayerGridBulider(context),
            stateCardGame(context)
          ],
        ),
      ),
    );
  }
}
