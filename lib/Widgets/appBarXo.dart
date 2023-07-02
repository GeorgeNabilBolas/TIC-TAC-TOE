import 'package:flutter/material.dart';

PreferredSizeWidget appBarXo(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(fontFamily: 'CarterOne'),
    ),
  );
}
