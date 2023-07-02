import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Widgets/navigatorButtonXO.dart';
import 'Widgets/playerCardTwo.dart';
import 'Widgets/playerTwoSetting.dart';
import 'models.dart';

class TwoPlayerScreen extends StatelessWidget {
  const TwoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              context.read<WidgetesXO>().tapSound(note1: true);
            }),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          'Two Players',
          style: TextStyle(fontFamily: 'CarterOne'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            playerCardTwo(context, name: 'Player 1', number: 1),
            playerCardTwo(context, name: 'Player 2', number: 2),
            playerTwoSetting(context),
            navigatorButtonXO(context,
                title: 'Start Game',
                route: 'twoplayerGame',
                pushReplacment: true)
          ],
        ),
      ),
    );
  }
}
