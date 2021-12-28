import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/update_model.dart';
import 'package:provider/provider.dart';

class SwitchList extends StatelessWidget {
  const SwitchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateModel>(
      builder: (_, notifier, __) => SwitchListTile(
        subtitle: const Text('+60₽'),
        secondary: Image.asset("assets/images/cheese.png"),
        title: Text(
          'Дополнительный сыр',
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF263238),
              )),
        ),
        value: notifier.addCheese,
        onChanged: (bool value) {
            notifier.addCheese = value;
            value ? {notifier.cheesePrice = 60} : {notifier.cheesePrice = 0};
            notifier.summa();
        },
      ),
    );
  }
}
