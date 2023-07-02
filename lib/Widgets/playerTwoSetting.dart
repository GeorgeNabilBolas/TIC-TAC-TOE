import 'package:flutter/material.dart';
import 'package:my_apps/Widgets/stopAudio.dart';

import 'Dialog_WinOrDrawScoreTwo.dart';

Container playerTwoSetting(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(colors: [
        Color.fromRGBO(255, 208, 50, 1),
        Color.fromRGBO(235, 23, 81, 1),
      ]),
      color: const Color.fromRGBO(155, 112, 229, 1),
    ),
    child: Column(
      children: [
        Text('Setting', style: Theme.of(context).textTheme.labelLarge),
        const Divider(color: Colors.white),
        Dialog_WinOrDrawScoreTwo(context, 'Win'),
        const Divider(color: Colors.white),
        Dialog_WinOrDrawScoreTwo(context, 'Draw'),
        const Divider(color: Colors.white),
        stopAudio(context)
      ],
    ),
  );
}
