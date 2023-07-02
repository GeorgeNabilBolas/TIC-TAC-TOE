import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Widgets/DialogOnePlayerSetting.dart';

import 'Widgets/choosenSideWidget.dart';
import 'Widgets/navigatorButtonXO.dart';

import 'models.dart';

class OnePlayerScreen extends StatelessWidget {
  const OnePlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('x');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
                context.read<WidgetesXO>().tapSound(note1: true);
              }),
          actions: [
            IconButton(
              onPressed: () {
                context.read<WidgetesXO>().tapSound(note1: true);
                context.read<WidgetesXO>().getPrefs();
                DialogOnePlayerSetting(context);
              },
              icon: Selector<WidgetesXO, bool>(
                selector: (_, val) => val.isXChosen,
                builder: (_, value, __) => value
                    ? const Icon(
                        Icons.settings,
                        color: Color.fromRGBO(235, 23, 81, 1),
                      )
                    : const Icon(
                        Icons.settings,
                        color: Color.fromRGBO(255, 208, 50, 1),
                      ),
              ),
            ),
          ],
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text(
            'Choose A Side',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: choosenSideWidget(context, title: 'X')),
              Expanded(child: choosenSideWidget(context, title: 'O')),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: navigatorButtonXO(context,
                    title: 'Start',
                    route: 'OnePlayerGame',
                    pushReplacment: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
