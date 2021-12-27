import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/util/constants.dart';
import 'package:pizza_app/widgets/button.dart';
import 'package:pizza_app/widgets/custom_radio.dart';
import 'package:pizza_app/widgets/custom_text.dart';
import 'package:pizza_app/widgets/dough_stack.dart';
import 'package:pizza_app/widgets/slider_stack.dart';
import 'package:pizza_app/widgets/switch_list.dart';

enum Sauce { spicy, sour, cheesy }

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);
  static double doughPrice = 0.00;
  static double saucePrice = 40.00;
  static double pizzaSizePrice = 450.00;
  static double cheesePrice = 0.00;
  static double sum = 0.00;
  static String text = '0.00';
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    OrderPage.sum = OrderPage.doughPrice +
        OrderPage.pizzaSizePrice +
        OrderPage.saucePrice +
        OrderPage.cheesePrice;
    OrderPage.text = OrderPage.sum.toStringAsFixed(2);
  }

  Sauce? _sauce = Sauce.spicy;
  final BorderRadius _radius = BorderRadius.circular(36.0);

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'Калькулятор пиццы',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 9.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Выберите параметры:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
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
                child: Listener(
                  onPointerUp: _updateSum,
                  child: const DoughStack(),
                ),
              ),
            ),
            const SizedBox(
              height: 19.0,
            ),
            const CustomText(
              text: 'Размер:',
              edgeInsets: 10.0,
              fontSize: 19.0,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Listener(
              onPointerUp: _updateSum,
              child: const SliderStack(),
            ),
            Listener(
              onPointerUp: _updateSum,
              child: CustomRadio(
                text: 'Острый',
                sauce: Sauce.spicy,
                val: _sauce,
                onChanged: onChangedRadioList,
                subtitle: '+40₽',
              ),
            ),
            Listener(
              onPointerUp: _updateSum,
              child: CustomRadio(
                text: 'Кисло-сладкий',
                sauce: Sauce.sour,
                val: _sauce,
                onChanged: onChangedRadioList,
                subtitle: '+50₽',
              ),
            ),
            Listener(
              onPointerUp: _updateSum,
              child: CustomRadio(
                text: 'Сырный',
                sauce: Sauce.cheesy,
                val: _sauce,
                onChanged: onChangedRadioList,
                subtitle: '+50₽',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: cheeseContainerColor,
                ),
                height: 72.0,
                child: Listener(
                    onPointerUp: _updateSum, child: const SwitchList()),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const CustomText(
                text: 'Стоимость:',
                edgeInsets: 25.0,
                fontSize: 18.0,
                fontWeight: FontWeight.normal),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    '${OrderPage.text} ₽',
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
              setState(() {
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
              });
            }),
          ],
        ),
      ),
    );
  }

  onChangedRadioList(Sauce? value) {
    setState(() {
      if (value != Sauce.spicy) {
        OrderPage.saucePrice = 50.0;
      } else {
        OrderPage.saucePrice = 40.0;
      }
      OrderPage.sum = OrderPage.doughPrice +
          OrderPage.pizzaSizePrice +
          OrderPage.saucePrice +
          OrderPage.cheesePrice;
      OrderPage.text = OrderPage.sum.toStringAsFixed(2);
      _sauce = value!;
    });
  }

  void _updateSum(PointerEvent details) {
    setState(() {
      OrderPage.sum = OrderPage.doughPrice +
          OrderPage.pizzaSizePrice +
          OrderPage.saucePrice +
          OrderPage.cheesePrice;
      OrderPage.text = OrderPage.sum.toStringAsFixed(2);
    });
  }
}
