import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/update_model.dart';
import 'package:pizza_app/util/constants.dart';
import 'package:pizza_app/widgets/button.dart';
import 'package:pizza_app/widgets/custom_radio.dart';
import 'package:pizza_app/widgets/custom_text.dart';
import 'package:pizza_app/widgets/dough_stack.dart';
import 'package:pizza_app/widgets/slider_stack.dart';
import 'package:pizza_app/widgets/switch_list.dart';
import 'package:provider/provider.dart';

enum Sauce { spicy, sour, cheesy }

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius _radius = BorderRadius.circular(36.0);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 88.0),
              child: Image(
                image: AssetImage(headerImage),
              ),
            ),
            const SizedBox(
              height: 33.0,
            ),
            Text(
              'Калькулятор пиццы',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 9.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Выберите параметры:',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 16.9, fontWeight: FontWeight.w600)),
              ),
            ),
             const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: DoughStack(),
            ),
            const CustomText(
              text: 'Размер:',
              edgeInsets: 10.0,
              fontSize: 19.0,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 5.0,
            ),
            const SliderStack(),
            Consumer<UpdateModel>(
              builder: (_, notifier, __) => CustomRadio(
                text: 'Острый',
                sauce: Sauce.spicy,
                val: notifier.sauce,
                subtitle: '+0₽',
              ),
            ),
            Consumer<UpdateModel>(
              builder: (_, notifier, __) => CustomRadio(
                text: 'Кисло-сладкий',
                sauce: Sauce.sour,
                val: notifier.sauce,
                subtitle: '+50₽',
              ),
            ),
            Consumer<UpdateModel>(
              builder: (_, notifier, __) => CustomRadio(
                text: 'Сырный',
                sauce: Sauce.cheesy,
                val: notifier.sauce,
                subtitle: '+80₽',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Theme.of(context).splashColor,
                ),
                height: 72.0,
                child: const SwitchList(),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const CustomText(
                text: 'Стоимость:',
                edgeInsets: 25.0,
                fontSize: 18.0,
                fontWeight: FontWeight.w400),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Consumer<UpdateModel>(
                    builder: (_, notifier, __) => Text(
                      '${notifier.summa().toStringAsFixed(2)} ₽',
                      style: const TextStyle(fontSize: 19),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                height: 34.0,
                decoration: BoxDecoration(
                  borderRadius: _radius,
                  color: Theme.of(context).splashColor,
                ),
              ),
            ),
            const SizedBox(
              height: 33.0,
            ),
            Button(
              onPressed: () => buttonPressed(context),
            ),
          ],
        ),
      ),
    );
  }

  void buttonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          if (Platform.isAndroid) {
            return AlertDialog(
              title: const Text('Заказ пиццы'),
              content: const Text('Заказ успешно сформирован'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          } else {
            return CupertinoAlertDialog(
              title: const Text('Заказ пиццы'),
              content: const Text('Заказ успешно сформирован'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          }
        });
  }
}
