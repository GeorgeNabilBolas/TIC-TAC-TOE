import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models.dart';
import 'Dialog_onePlayerGameResult.dart';
import 'textOnePlayerGameXO.dart';

Container onePlayerGridBulider(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(10),
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
        ...List.generate(9, (index) {
          return Consumer<WidgetesXO>(
            builder: (_, value, __) => GestureDetector(
              onTap: () async {
                value.tapSound(note1: true);

                if (value.isStillInGame) {
                  value.level == 'Easy'
                      ? value.onePlayerGameEASY(index)
                      : value.level == 'Medium'
                          ? value.onePlayerGameMEDIUM(index)
                          : value.onePlayerGameHARD(index);
                }
                value.onePlayerGameStateLogic();
                if (!value.isStillInGame) {
                  value.setWinner();

                  if (value.setwinplayerXcount < value.setwinscore &&
                      value.setwinplayerOcount < value.setwinscore &&
                      value.setdrawcount < value.setdrawscore) {
                    await Future.delayed(
                      const Duration(milliseconds: 600),
                      () {
                        value.onePlayerGameRepeat();
                        if (!value.isXChosen) {
                          value.Chart.shuffle();
                          value.onePlayerGameXList.add(value.Chart.first);
                          value.Chart.remove(value.Chart.first);
                        }
                      },
                    );
                  } else if (value.multiTouche) {
                    value.multiTouche = false;
                    await Future.delayed(const Duration(milliseconds: 600), () {
                      value.setWinner();
                      value.isDraw
                          ? value.tapSound(note2: true)
                          : value.isXwin && value.onePlayerGameisXChosen ||
                                  value.isOwin && !value.onePlayerGameisXChosen
                              ? value.tapSound(winner: true)
                              : value.tapSound(Lose: true);

                      Dialog_onePlayerGameResult(context);
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
                    title: value.logicOnePlayerGame(context, index), size: 50),
              ),
            ),
          );
        })
      ],
    ),
  );
}
