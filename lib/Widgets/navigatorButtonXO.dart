import 'package:flutter/material.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Widget navigatorButtonXO(
  BuildContext context, {
  required String title,
  required String route,
  bool pushReplacment = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    child: Consumer<WidgetesXO>(
      builder: (__, value, _) => FilledButton(
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

          if (title == 'Start') {
            value.setonePlayerGameData();
            // onePlayerGameStateLogic();
            if (!value.onePlayerGameisXChosen) {
              value.Chart.shuffle();
              value.onePlayerGameXList.add(value.Chart.first);
              value.Chart.remove(value.Chart.first);
            }
          } else if (title == 'Start Game') value.setonePlayerGameData();

          pushReplacment
              ? Navigator.pushReplacementNamed(context, route)
                  .then((_) => value.tapSound(note1: true))
              : Navigator.pushNamed(context, route);
        },
        child: Text(
          title,
          style: const TextStyle(fontFamily: 'PaytoneOne', fontSize: 25),
        ),
      ),
    ),
  );
}
