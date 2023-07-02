import 'package:flutter/material.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Widget stopAudio(BuildContext context) {
  return Consumer<WidgetesXO>(
    builder: (_, value, __) => FilledButton.icon(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              value.setAudioIsPlayed ? Colors.green : Colors.red)),
      onPressed: () {
        value.stopAudioOnPressed();
      },
      label: Text('Sound', style: Theme.of(context).textTheme.labelMedium),
      icon: Icon(value.setAudioIsPlayed ? Icons.volume_up : Icons.volume_off),
    ),
  );
}
