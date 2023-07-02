import 'package:flutter/material.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

import 'Dialog_AvatarTwo.dart';
import 'Dialog_TextFieldTwo.dart';

Widget playerCardTwo(BuildContext context,
    {required String name, required int number}) {
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromRGBO(155, 112, 229, 1),
        borderRadius: BorderRadius.circular(20)),
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                fontFamily: 'CarterOne',
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: number == 2
                    ? const Color.fromRGBO(255, 208, 50, 1)
                    : const Color.fromRGBO(235, 23, 81, 1),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .5,
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(39, 23, 93, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Dialog_TextFieldTwo(context, number),
            ),
          ],
        ),
        Divider(
            thickness: 5,
            color: number == 2
                ? const Color.fromRGBO(255, 208, 50, 1)
                : const Color.fromRGBO(235, 23, 81, 1)),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('Avatar', style: Theme.of(context).textTheme.labelMedium),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
            (id) => Dialog_AvatarTwo(context, id: id, number: number),
          ),
        )
      ],
    ),
  );
}
