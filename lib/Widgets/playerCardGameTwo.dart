import 'package:flutter/material.dart';
import 'package:my_apps/Widgets/textOnePlayerGameXO.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Widget playerCardGameTwo(BuildContext context, {required String id}) {
  return Consumer<WidgetesXO>(
    builder: (_, value, __) => AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: MediaQuery.of(context).size.width / 3,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        //color: Color.fromRGBO(39, 23, 93, 1),
        color:
            value.xPlay && id == 'Player 1' || !value.xPlay && id == 'Player 2'
                ? const Color.fromRGBO(155, 112, 229, 1)
                : const Color.fromRGBO(39, 23, 93, 1),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.height * .04,
            backgroundImage: AssetImage(
              id == 'Player 1'
                  ? value.avatars[value.setAvatartidTwo_1]
                  : value.avatars[value.setAvatartidTwo_2],
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            id == 'Player 1'
                ? (value.setnameTwo_1.text == ''
                    ? 'Player 1'
                    : value.setnameTwo_1.text)
                : (value.setnameTwo_2.text == ''
                    ? 'Player 2'
                    : value.setnameTwo_2.text),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textOnePlayerGameXO(
                title: id == 'Player 1' ? 'X : ' : 'O : ',
                size: 30,
              ),
              Text(
                  id == 'Player 1'
                      ? '${value.setwinplayerTwocount_1}'
                      : '${value.setwinplayerTwocount_2}',
                  style: Theme.of(context).textTheme.labelMedium)
            ],
          )
        ],
      ),
    ),
  );
}
