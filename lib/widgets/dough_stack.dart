import 'package:flutter/material.dart';
import 'package:pizza_app/order_page.dart';
import 'package:pizza_app/util/constants.dart';

class DoughStack extends StatefulWidget {
  const DoughStack({
    Key? key,
  }) : super(key: key);

  @override
  _DoughStackState createState() => _DoughStackState();
}

class _DoughStackState extends State<DoughStack> {
  double _xAlign = 0;
  Color _regularColor = selectedDoughColor;
  Color _thinColor = normalDoughColor;

  @override
  void initState() {
    super.initState();
    _xAlign = regularDoughAlign;
    _regularColor = selectedDoughColor;
    _thinColor = normalDoughColor;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedAlign(
          alignment: Alignment(_xAlign, 0),
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: doughHeight,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(36.0),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              OrderPage.doughPrice = 0.00;
              sum();
              _xAlign = regularDoughAlign;
              _regularColor = selectedDoughColor;
              _thinColor = normalDoughColor;
            });
          },
          child: Align(
            alignment: const Alignment(-1, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Text(
                'Обычное тесто',
                style: TextStyle(
                  color: _regularColor,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              OrderPage.doughPrice = 100.00;
              sum();
              _xAlign = thinDoughAlign;
              _thinColor = selectedDoughColor;
              _regularColor = normalDoughColor;
            });
          },
          child: Align(
            alignment: const Alignment(1, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Text(
                'Тонкое тесто',
                style: TextStyle(
                  color: _thinColor,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ],
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
