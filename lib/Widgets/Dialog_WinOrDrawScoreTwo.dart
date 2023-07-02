import 'package:flutter/material.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Widget Dialog_WinOrDrawScoreTwo(BuildContext context, String type) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('$type Score : ', style: Theme.of(context).textTheme.labelLarge),
      Consumer<WidgetesXO>(
        builder: (_, value, __) => Row(
          children: [
            FloatingActionButton.small(
                heroTag: 'addtwo$type',
                elevation: 0,
                backgroundColor: const Color.fromRGBO(54, 36, 141, 1),
                onPressed: () {
                  value.tapSound(note1: true);
                  value.floatingactionbuttonAddTwo(type, add: true);
                },
                child: const Icon(Icons.arrow_upward, color: Colors.white)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '${type == 'Win' ? value.setwinscoreTwo : value.setdrawscoreTwo}',
                  style: Theme.of(context).textTheme.labelMedium),
            ),
            FloatingActionButton.small(
                heroTag: 'subtwo$type',
                elevation: 0,
                backgroundColor: Color.fromRGBO(54, 36, 141, 1),
                onPressed: () {
                  value.tapSound(note1: true);
                  value.floatingactionbuttonAddTwo(type, add: false);
                },
                child: const Icon(Icons.arrow_downward, color: Colors.white)),
          ],
        ),
      ),
    ],
  );
}
