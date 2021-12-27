import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Sauce { spicy, sour, cheesy }

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

const double height = 40.0;
const double regularAlign = -1;
const double thinAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _OrderPageState extends State<OrderPage> {
  double _xAlign = 0;
  Color _regularColor = selectedColor;
  Color _thinColor = normalColor;
  double _currentVal = 1;
  String _pizzaSize = 'Средняя';
  Sauce? _sauce = Sauce.spicy;
  bool _addCheese = false;
  final ButtonStyle _buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(42),
      primary: const Color(0xFF0079D0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      textStyle: const TextStyle(fontSize: 16.0));

  @override
  void initState() {
    super.initState();
    _xAlign = regularAlign;
    _regularColor = selectedColor;
    _thinColor = normalColor;
  }

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
                image: AssetImage('assets/images/img.png'),
              ),
            ),
            const SizedBox(
              height: 33.0,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Калькулятор пиццы',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
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
                height: height,
                decoration: BoxDecoration(
                  color: const Color(0xFFECEFF1),
                  borderRadius: BorderRadius.circular(36.0),
                ),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      alignment: Alignment(_xAlign, 0),
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: height,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0079D0),
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _xAlign = regularAlign;
                          _regularColor = selectedColor;
                          _thinColor = normalColor;
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
                          _xAlign = thinAlign;
                          _thinColor = selectedColor;
                          _regularColor = normalColor;
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
                ),
              ),
            ),
            const SizedBox(
              height: 19.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Размер:',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        _pizzaSize,
                        style: const TextStyle(
                            fontSize: 20, color: Color(0xFF0079D0)),
                      ),
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36.0),
                      color: const Color(0xFFECEFF1),
                    ),
                    height: 34.0,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SliderTheme(
                    data: const SliderThemeData(
                      thumbColor: Color(0xFF0079D0),
                      activeTickMarkColor: Colors.white,
                      inactiveTickMarkColor: Color(0xFF0079D0),
                      tickMarkShape:
                          RoundSliderTickMarkShape(tickMarkRadius: 2),
                      thumbShape: RoundSliderThumbShape(
                        elevation: 5,
                        enabledThumbRadius: 5,
                      ),
                    ),
                    child: Slider(
                      max: 2,
                      divisions: 2,
                      value: _currentVal,
                      onChanged: (double value) {
                        setState(() {
                          if (value == 0) {
                            _pizzaSize = 'Маленькая';
                          } else if (value == 1) {
                            _pizzaSize = 'Средняя';
                          } else {
                            _pizzaSize = 'Большая';
                          }
                          _currentVal = value;
                        });
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 47, 0, 0),
                  child: Text(
                    'Соус:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            RadioListTile<Sauce>(
              activeColor: const Color(0xFF5DB075),
              controlAffinity: ListTileControlAffinity.trailing,
              title: const Text('Острый'),
              value: Sauce.spicy,
              groupValue: _sauce,
              onChanged: (Sauce? value) {
                setState(() {
                  _sauce = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                height: 1,
                color: const Color(0xFFE8E8E8),
              ),
            ),
            RadioListTile<Sauce>(
              activeColor: const Color(0xFF5DB075),
              controlAffinity: ListTileControlAffinity.trailing,
              title: const Text('Кисло-сладкий'),
              value: Sauce.sour,
              groupValue: _sauce,
              onChanged: (Sauce? value) {
                setState(() {
                  _sauce = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                height: 1,
                color: const Color(0xFFE8E8E8),
              ),
            ),
            RadioListTile<Sauce>(
              activeColor: const Color(0xFF5DB075),
              controlAffinity: ListTileControlAffinity.trailing,
              title: const Text('Сырный'),
              value: Sauce.cheesy,
              groupValue: _sauce,
              onChanged: (Sauce? value) {
                setState(() {
                  _sauce = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                height: 1,
                color: const Color(0xFFE8E8E8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xFFF0F0F0),
                ),
                height: 56.0,
                child: SwitchListTile(
                  secondary: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image.asset("assets/images/cheese.png"),
                  ),
                  title: const Text(
                    'Дополнительный сыр',
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF263238)),
                  ),
                  value: _addCheese,
                  onChanged: (bool value) {
                    setState(() {
                      _addCheese = value;
                    });
                  },
                  activeColor: const Color(0xFF0079D0),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text('Стоимость:', style: TextStyle(fontSize: 18.0)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 34.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: const Color(0xFFECEFF1),
                ),
              ),
            ),
            const SizedBox(
              height: 33.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 83.0),
              child: ElevatedButton(
                style: _buttonStyle,
                onPressed: () {},
                child: const Text('Заказать'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
