import 'package:flutter/material.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Widget onePlayerGameLevel(BuildContext context) {
  return Consumer<WidgetesXO>(
    builder: (_, value, __) => Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: RadioListTile(
              secondary: const CircleAvatar(
                backgroundImage: AssetImage('images/Easy.png'),
              ),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(style: BorderStyle.none)),
              tileColor: Colors.amber,
              activeColor: const Color.fromRGBO(39, 23, 93, 1),
              title:
                  Text('Easy', style: Theme.of(context).textTheme.labelMedium),
              value: 'Easy',
              groupValue: value.level,
              onChanged: (val) {
                value.tapSound(note1: true);
                value.radiobuttonOnChanged(val);
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: RadioListTile(
              secondary: const CircleAvatar(
                backgroundImage: AssetImage('images/Midum.png'),
              ),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(style: BorderStyle.none)),
              activeColor: const Color.fromRGBO(39, 23, 93, 1),
              tileColor: Colors.green[800],
              title: Text('Medium',
                  style: Theme.of(context).textTheme.labelMedium),
              value: 'Medium',
              groupValue: value.level,
              onChanged: (val) {
                value.tapSound(note1: true);
                value.radiobuttonOnChanged(val);
              }),
        ),
        RadioListTile(
            secondary: const CircleAvatar(
              backgroundImage: AssetImage('images/Hard.png'),
            ),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(style: BorderStyle.none)),
            activeColor: const Color.fromRGBO(39, 23, 93, 1),
            tileColor: Colors.red[800],
            title: Text('Hard', style: Theme.of(context).textTheme.labelMedium),
            value: 'Hard',
            groupValue: value.level,
            onChanged: (val) {
              value.tapSound(note1: true);
              value.radiobuttonOnChanged(val);
            }),
      ],
    ),
  );
}
