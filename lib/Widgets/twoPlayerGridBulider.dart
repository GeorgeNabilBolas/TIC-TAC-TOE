import 'package:flutter/material.dart';
import 'package:my_apps/Widgets/textOnePlayerGameXO.dart';
import 'package:provider/provider.dart';

import '../models.dart';
import 'Dialog_twoPlayerGameResult.dart';

Container twoPlayerGridBulider(BuildContext context) {
  return Container(
    // margin: const EdgeInsets.all(10),
    width: MediaQuery.of(context).size.width - 20,
    height: MediaQuery.of(context).size.width - 20,
    decoration: BoxDecoration(
        color: const Color.fromRGBO(155, 112, 229, 1),
        borderRadius: BorderRadius.circular(20)),
    child: GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.0,
      children: [
        ...List.generate(
          9,
          (index) {
            return Consumer<WidgetesXO>(
              builder: (_, value, __) => GestureDetector(
                onTap: () async {
                  value.tapSound(note1: true);

                  if (value.isStillInGame) {
                    value.twoPlayerGame(index);
                  }
                  value.onePlayerGameStateLogic();
                  if (!value.isStillInGame) {
                    value.setWinnerTwo();
                    if (value.setwinplayerTwocount_1 < value.setwinscoreTwo &&
                        value.setwinplayerTwocount_2 < value.setwinscoreTwo &&
                        value.setdrawcountTwo < value.setdrawscoreTwo) {
                      await Future.delayed(
                        const Duration(milliseconds: 600),
                        () {
                          value.onePlayerGameRepeat();
                        },
                      );
                    } else {
                      await Future.delayed(const Duration(milliseconds: 600),
                          () {
                        value.setWinnerTwo();
                        value.isDraw
                            ? value.tapSound(Lose: true)
                            : value.tapSound(winner: true);
                        Dialog_twoPlayerGameResult(context);
                      });
                    }
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: value.winnerXO.contains(index)
                          ? Colors.green
                          : const Color.fromRGBO(39, 23, 93, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: textOnePlayerGameXO(
                      title: value.logicOnePlayerGame(context, index),
                      size: 50),
                ),
              ),
            );
          },
        )
      ],
    ),
  );
}
