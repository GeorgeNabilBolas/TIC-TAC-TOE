import 'package:flutter/material.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Object Dialog_onePlayerGameResult(BuildContext ctx) {
  return showDialog(
    barrierDismissible: false,
    context: ctx,
    builder: (context) => Consumer<WidgetesXO>(
      builder: (_, value, __) => AlertDialog(
        scrollable: true,
        contentPadding: const EdgeInsets.all(8),
        actionsAlignment: MainAxisAlignment.spaceAround,
        backgroundColor: const Color.fromRGBO(54, 36, 141, 1),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                value.isDraw
                    ? 'Draw'
                    : value.isXwin && value.onePlayerGameisXChosen ||
                            value.isOwin && !value.onePlayerGameisXChosen
                        ? 'You Win'
                        : 'You Lose',
                style: Theme.of(context).textTheme.labelLarge),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(155, 112, 229, 1),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(8),
              child: CircleAvatar(
                  radius: 100,
                  backgroundImage: value.isDraw
                      ? const AssetImage('images/Draw.png')
                      : value.isXwin && value.onePlayerGameisXChosen ||
                              value.isOwin && !value.onePlayerGameisXChosen
                          ? const AssetImage('images/Win.png')
                          : const AssetImage('images/Lose.png')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilledButton(
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(
                      Size(MediaQuery.of(context).size.width, 0)),
                  elevation: const MaterialStatePropertyAll(5),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(39, 23, 93, 1),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  value.tapSound(note1: true);
                  value.setonePlayerGameData();
                  if (!value.onePlayerGameisXChosen) {
                    value.Chart.shuffle();
                    value.onePlayerGameXList.add(value.Chart.first);
                    value.Chart.remove(value.Chart.first);
                  }
                },
                child: const Text(
                  'Play Again',
                  style: TextStyle(fontFamily: 'PaytoneOne', fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilledButton(
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(
                      Size(MediaQuery.of(context).size.width, 0)),
                  elevation: const MaterialStatePropertyAll(5),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(39, 23, 93, 1),
                  ),
                ),
                onPressed: () {
                  value.tapSound(note1: true);

                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('MainPage', (route) => false);
                  value.setonePlayerGameData();
                },
                child: const Text(
                  'Home',
                  style: TextStyle(fontFamily: 'PaytoneOne', fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
