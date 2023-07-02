import 'package:flutter/material.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Widget Dialog_TextFieldTwo(BuildContext context, int number) {
  return Selector<WidgetesXO, TextEditingController>(
    selector: (_, val) => number == 1 ? val.setnameTwo_1 : val.setnameTwo_2,
    builder: (__, value, _) => TextField(
      controller: value,
      cursorColor: Colors.white,
      style: Theme.of(context).textTheme.labelMedium,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: number == 1 ? 'Player 1' : 'Player 2',
        hintStyle: Theme.of(context).textTheme.labelMedium,
        border: InputBorder.none,
      ),
    ),
  );
}
