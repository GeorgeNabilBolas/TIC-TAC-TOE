import 'package:flutter/widgets.dart';

Widget textXO(
    {required final String title, double size = 150, double opacity = 1}) {
  return AnimatedDefaultTextStyle(
    duration: const Duration(seconds: 2),
    curve: Curves.linearToEaseOut,
    style: TextStyle(
        color: title.contains('O')
            ? Color.fromRGBO(255, 208, 50, opacity)
            : Color.fromRGBO(235, 23, 81, opacity),
        fontSize: size,
        fontFamily: 'CarterOne'),
    child: Text(
      title,
    ),
  );
}
