import 'package:flutter/material.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Widget Dialog_Avatar(BuildContext context, {required final int id}) {
  return Consumer<WidgetesXO>(
    builder: (_, value, __) => GestureDetector(
      onTap: () {
        value.tapSound(note1: true);
        value.Dialog_AvatarOnTap(id);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            strokeAlign: 1,
            color: (value.setAvatartid == id)
                ? const Color.fromRGBO(39, 23, 93, 1)
                : const Color.fromRGBO(155, 112, 229, 1),
          ),
          borderRadius: BorderRadius.circular(80),
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(
            value.avatars[id],
          ),
        ),
      ),
    ),
  );
}
