import 'package:flutter/material.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Widget Dialog_TextField(BuildContext context) {
  return Selector<WidgetesXO, TextEditingController>(
    selector: (_, val) => val.setname,
    builder: (__, value, _) => TextField(
      controller: value,
      cursorColor: Colors.white,
      style: Theme.of(context).textTheme.labelMedium,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: value.text,
        hintStyle: Theme.of(context).textTheme.labelMedium,
        border: InputBorder.none,
      ),
    ),
  );
}
