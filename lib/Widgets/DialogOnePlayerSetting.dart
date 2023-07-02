import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models.dart';
import 'Dialog_Avatar.dart';
import 'Dialog_TextField.dart';
import 'Dialog_WinOrDrawScore.dart';
import 'onePlayerGameLevel.dart';
import 'stopAudio.dart';

Future<dynamic> DialogOnePlayerSetting(BuildContext context) {
  print(context.read<WidgetesXO>().level);
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
      insetPadding:
          const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
      scrollable: true,
      contentPadding: const EdgeInsets.all(8),
      backgroundColor: const Color.fromRGBO(155, 112, 229, 1),
      actionsAlignment: MainAxisAlignment.spaceAround,
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: const Alignment(1, 1),
              child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Color.fromRGBO(155, 112, 229, 1),
                  ),
                  onPressed: () {
                    context.read<WidgetesXO>().tapSound(note1: true);
                    context.read<WidgetesXO>().getPrefs();

                    Navigator.pop(context);
                  }),
            ),
            Text(
              'Setting',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Divider(color: Colors.white),
            stopAudio(context),
            const Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Name', style: Theme.of(context).textTheme.labelMedium),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(39, 23, 93, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Dialog_TextField(context),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.white),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Avatar',
                      style: Theme.of(context).textTheme.labelMedium),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (id) => Dialog_Avatar(context, id: id),
                  ),
                )
              ],
            ),
            const Divider(color: Colors.white),
            Dialog_WinOrDrawScore(context, 'Win'),
            Dialog_WinOrDrawScore(context, 'Draw'),
            const Divider(color: Colors.white),
            onePlayerGameLevel(context),
            const Divider(color: Colors.white),
            TextButton(
              onPressed: () {
                context.read<WidgetesXO>().tapSound(note1: true);

                context.read<WidgetesXO>().setPrefs();
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 5)),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.white)),
              child: const Text(
                'Done',
                style: TextStyle(
                    color: Color.fromRGBO(155, 112, 229, 1),
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
