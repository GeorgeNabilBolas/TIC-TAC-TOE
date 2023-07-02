import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models.dart';

Consumer<WidgetesXO> twoPlayerDrawCardnewMethod() {
  return Consumer<WidgetesXO>(
    builder: (_, value, __) => Column(
      children: [
        const CircleAvatar(
            radius: 35, backgroundImage: AssetImage('images/handshake.png')),
        Container(
          margin: const EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(235, 23, 81, 1),
              Color.fromRGBO(255, 208, 50, 1)
            ]),
          ),
          width: value.setdrawscoreTwo * 10 + 45,
          height: value.setdrawscoreTwo * 10 + 45,
          child: GridView.count(
            crossAxisCount:
                value.setdrawscoreTwo < 4 ? value.setdrawscoreTwo : 3,
            shrinkWrap: true,
            children: List.generate(value.setdrawscoreTwo, (index) {
              int x = index + 1;
              return x <= value.setdrawcountTwo
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green.shade200,
                    )
                  : const Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.white,
                    );
            }),
          ),
        )
      ],
    ),
  );
}
