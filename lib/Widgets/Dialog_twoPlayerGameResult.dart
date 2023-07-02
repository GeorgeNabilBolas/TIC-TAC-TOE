import 'package:flutter/material.dart';
import 'package:my_apps/Widgets/textXO.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Object Dialog_twoPlayerGameResult(BuildContext ctx) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Result : ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  value.isDraw
                      ? 'Draw'
                      : value.isXwin
                          ? value.setnameTwo_1.text == ''
                              ? 'Player One Win'
                              : '${value.setnameTwo_1.text} Win'
                          : value.setnameTwo_2.text == ''
                              ? 'Player Two Win'
                              : '${value.setnameTwo_2.text} Win',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: 'CarterOne',
                      fontSize: 20,
                      color: value.isDraw
                          ? Colors.green[800]
                          : value.isXwin
                              ? const Color.fromRGBO(235, 23, 81, 1)
                              : const Color.fromRGBO(255, 208, 50, 1)),
                ),
              ],
            ),
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
                      : value.isXwin
                          ? AssetImage(value.avatars[value.setAvatartidTwo_1])
                          : AssetImage(value.avatars[value.setAvatartidTwo_2])),
            ),
            Text('Score', style: Theme.of(context).textTheme.labelLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .2,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(155, 112, 229, 1),
                  ),
                  child: Column(
                    children: [
                      textXO(title: 'X', size: 50),
                      Text(
                        '${value.setwinplayerTwocount_1}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                Text(':', style: Theme.of(context).textTheme.labelLarge),
                Container(
                  width: MediaQuery.of(context).size.width * .2,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(155, 112, 229, 1),
                  ),
                  child: Column(
                    children: [
                      textXO(title: 'O', size: 50),
                      Text(
                        '${value.setwinplayerTwocount_2}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ],
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

                  Navigator.of(context).pop();
                  value.setonePlayerGameData();
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
