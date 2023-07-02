import 'package:flutter/material.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Widget Dialog_AvatarTwo(BuildContext context,
    {required final int id, required final int number}) {
  return Consumer<WidgetesXO>(
    builder: (_, value, __) => GestureDetector(
      onTap: () {
        value.tapSound(note1: true);

        value.Dialog_AvatarOnTapTwo(id, number);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            strokeAlign: 1,
            color: (value.setAvatartidTwo_1 == id && number == 1 ||
                    value.setAvatartidTwo_2 == id && number == 2)
                ? const Color.fromRGBO(39, 23, 93, 1)
                : const Color.fromRGBO(155, 112, 229, 1),
          ),
          borderRadius: BorderRadius.circular(80),
        ),
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.width * .08,
          backgroundImage: AssetImage(
            value.avatars[id],
          ),
        ),
      ),
    ),
  );
}
