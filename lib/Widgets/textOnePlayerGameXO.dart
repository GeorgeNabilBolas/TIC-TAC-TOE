import 'package:flutter/widgets.dart';

Widget textOnePlayerGameXO(
    {required final String title, double size = 150, double opacity = 1}) {
  return Text(
    title,
    style: TextStyle(
        color: title.contains('O')
            ? Color.fromRGBO(255, 208, 50, opacity)
            : Color.fromRGBO(235, 23, 81, opacity),
        fontSize: size,
        fontFamily: 'CarterOne'),
  );
}
