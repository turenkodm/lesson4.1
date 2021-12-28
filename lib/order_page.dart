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
    final notifier = Provider.of<UpdateModel>(context, listen: false);
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
            const SizedBox(
              height: 33.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: doughHeight,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: _radius,
                ),
                child: const DoughStack(),
              ),
            ),
            const SizedBox(
              height: 19.0,
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
            CustomRadio(
              text: 'Острый',
              sauce: Sauce.spicy,
              val: notifier.sauce,
              subtitle: '+0₽',
            ),
            CustomRadio(
              text: 'Кисло-сладкий',
              sauce: Sauce.sour,
              val: notifier.sauce,
              subtitle: '+50₽',
            ),
            CustomRadio(
              text: 'Сырный',
              sauce: Sauce.cheesy,
              val: notifier.sauce,
              subtitle: '+80₽',
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: cheeseContainerColor,
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
                  child: Text(
                    '${notifier.summa().toStringAsFixed(2)} ₽',
                    style: const TextStyle(fontSize: 19),
                    textAlign: TextAlign.center,
                  ),
                ),
                height: 34.0,
                decoration: BoxDecoration(
                  borderRadius: _radius,
                  color: backgroundColor,
                ),
              ),
            ),
            const SizedBox(
              height: 33.0,
            ),
            Button(onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
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
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
