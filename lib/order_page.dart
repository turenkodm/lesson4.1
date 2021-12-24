import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

const double width = 300.0;
const double height = 40.0;
const double regularAlign = -1;
const double thinAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _OrderPageState extends State<OrderPage> {
  double xAlign = 0;
  Color regularColor = selectedColor;
  Color thinColor = normalColor;

  @override
  void initState() {
    super.initState();
    xAlign = regularAlign;
    regularColor = selectedColor;
    thinColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            const Text(
              'Калькулятор пиццы',
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 9.0,
            ),
            const Text(
              'Выберите параметры:',
              style: TextStyle(fontSize: 19.0),
            ),
            const SizedBox(
              height: 33.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: height,
                decoration: const BoxDecoration(
                  color: Color(0xFFECEFF1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      alignment: Alignment(xAlign, 0),
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        width: width * 0.65,
                        height: height,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0079D0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = regularAlign;
                          regularColor = selectedColor;
                          thinColor = normalColor;
                        });
                      },
                      child: Align(
                        alignment: const Alignment(-1, 0),
                        child: Container(
                          width: width * 0.65,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Text(
                            'Обычное тесто',
                            style: TextStyle(
                              color: regularColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = thinAlign;
                          thinColor = selectedColor;
                          regularColor = normalColor;
                        });
                      },
                      child: Align(
                        alignment: const Alignment(1, 0),
                        child: Container(
                          width: width * 0.65,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Text(
                            'Тонкое тесто',
                            style: TextStyle(
                              color: thinColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
