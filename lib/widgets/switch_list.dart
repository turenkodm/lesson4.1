import 'package:flutter/material.dart';

import '../order_page.dart';

class SwitchList extends StatefulWidget {
  const SwitchList({Key? key}) : super(key: key);

  @override
  State<SwitchList> createState() => _SwitchListState();
}

class _SwitchListState extends State<SwitchList> {
  bool _addCheese = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      subtitle: const Text('+60₽'),
      secondary: Image.asset("assets/images/cheese.png"),
      title: const Text(
        'Дополнительный сыр',
        style: TextStyle(fontSize: 16.0, color: Color(0xFF263238)),
      ),
      value: _addCheese,
      onChanged: (bool value) {
        setState(() {
          _addCheese = value;
          if (value == true) {
            OrderPage.cheesePrice = 60.00;
          } else {
            OrderPage.cheesePrice = 0.00;
          }
          sum();
        });
      },
    );
  }

  void sum() {
    OrderPage.sum = OrderPage.doughPrice +
        OrderPage.pizzaSizePrice +
        OrderPage.saucePrice +
        OrderPage.cheesePrice;
    OrderPage.text = OrderPage.sum.toStringAsFixed(2);
  }
}
