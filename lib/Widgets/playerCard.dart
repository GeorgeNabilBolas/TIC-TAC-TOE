import 'package:flutter/material.dart';
import 'package:my_apps/Widgets/textOnePlayerGameXO.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Widget playerCard(BuildContext context, {required String id}) {
  return Expanded(
    child: Container(
      width: MediaQuery.of(context).size.width / 3,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        //color: Color.fromRGBO(39, 23, 93, 1),
        color: const Color.fromRGBO(155, 112, 229, 1),
      ),
      child: Column(
        children: [
          Consumer<WidgetesXO>(
            builder: (_, value, __) => CircleAvatar(
              radius: MediaQuery.of(context).size.width * .12,
              backgroundImage: AssetImage(
                id == 'Computer' && value.level == 'Easy'
                    ? 'images/Easy.png'
                    : id == 'Computer' && value.level == 'Medium'
                        ? 'images/Midum.png'
                        : id == 'Computer' && value.level == 'Hard'
                            ? 'images/Hard.png'
                            : value.avatars[value.setAvatartid],
              ),
            ),
          ),
          Consumer<WidgetesXO>(
            builder: (_, value, __) => Text(
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              id == 'Computer' && value.level == 'Easy'
                  ? 'Easy'
                  : id == 'Computer' && value.level == 'Medium'
                      ? 'Medium'
                      : id == 'Computer' && value.level == 'Hard'
                          ? 'Hard'
                          : value.setname.text,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Consumer<WidgetesXO>(
            builder: (_, value, __) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textOnePlayerGameXO(
                  title: (value.isXChosen && id != 'Computer') ||
                          (!value.isXChosen && id == 'Computer')
                      ? 'X : '
                      : 'O : ',
                  size: 30,
                ),
                Text(
                    (value.isXChosen && id != 'Computer') ||
                            (!value.isXChosen && id == 'Computer')
                        ? '${value.setwinplayerXcount}'
                        : '${value.setwinplayerOcount}',
                    style: Theme.of(context).textTheme.labelMedium)
              ],
            ),
          )
        ],
      ),
    ),
  );
}
