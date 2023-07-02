import 'package:flutter/widgets.dart';
import 'package:my_apps/Widgets/textXO.dart';
import 'package:my_apps/models.dart';
import 'package:provider/provider.dart';

Widget choosenSideWidget(BuildContext context, {required String title}) {
  return Consumer<WidgetesXO>(
    builder: (__, value, _) => GestureDetector(
      onTap: () {
        value.tapSound(note1: true);
        value.choosenSideWidgetOnTap(title);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linearToEaseOut,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            boxShadow: [
              if (title == 'X' && value.isXChosen == true ||
                  title == 'O' && value.isXChosen == false)
                const BoxShadow()
              else ...{
                const BoxShadow(
                  blurRadius: 8,
                  offset: Offset(10, 10),
                  color: Color.fromARGB(255, 30, 17, 73),
                ),
                const BoxShadow(
                  blurRadius: 8,
                  offset: Offset(-10, -10),
                  color: Color.fromARGB(255, 66, 46, 165),
                ),
              }
            ],
            color: title == 'X' && value.isXChosen == true ||
                    title == 'O' && value.isXChosen == false
                ? const Color.fromRGBO(39, 23, 93, 1)
                : const Color.fromRGBO(54, 36, 141, 1),
            borderRadius: BorderRadius.circular(20)),
        child: textXO(title: title),
      ),
    ),
  );
}
