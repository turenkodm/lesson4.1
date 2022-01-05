import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/update_model.dart';
import 'package:pizza_app/util/constants.dart';
import 'package:provider/provider.dart';

class SwitchList extends StatelessWidget {
  const SwitchList({Key? key}) : super(key: key);

  Widget _imageCheese(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (isDarkMode == true) {
      return Image.asset(cheeseWhiteImage);
    } else {
      return Image.asset(cheeseImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateModel>(
      builder: (_, notifier, __) => SwitchListTile.adaptive(
        subtitle: const Text('+60₽'),
        secondary: _imageCheese(context),
        activeColor: Theme.of(context).toggleableActiveColor,
        title: Text(
          'Дополнительный сыр',
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
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
