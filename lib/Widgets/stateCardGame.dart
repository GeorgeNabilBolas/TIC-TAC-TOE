import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models.dart';

Container stateCardGame(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    // width: MediaQuery.of(context).size.width,
    // height: MediaQuery.of(context).size.width * .2,
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          const Color.fromRGBO(235, 23, 81, 1),
          Colors.green.shade800,
          const Color.fromRGBO(255, 208, 50, 1)
        ]),
        //color: const Color.fromRGBO(155, 112, 229, 1),
        borderRadius: BorderRadius.circular(15)),
    margin: const EdgeInsets.all(8),
    child: Consumer<WidgetesXO>(
      builder: (_, value, __) => Text(
          value.isXwin
              ? 'X IS The Winner'
              : value.isOwin
                  ? 'O IS The Winner'
                  : value.isDraw
                      ? 'Draw'
                      : 'Still in game',
          style: Theme.of(context).textTheme.labelLarge),
    ),
  );
}
