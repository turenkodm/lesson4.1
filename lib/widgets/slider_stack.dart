import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../update_model.dart';

class SliderStack extends StatefulWidget {
   const SliderStack({Key? key}) : super(key: key);

  @override
  State<SliderStack> createState() => _SliderStackState();
}

class _SliderStackState extends State<SliderStack> {
  double _currentVal = 1;
  String _pizzaSize = 'Средняя';

  Widget _pizzaSizeContainer() {
if (Platform.isAndroid) {
  return Container(
    child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Consumer<UpdateModel>(
            builder: (_, notifier, __) => Text(
              _pizzaSize,
              style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
            ),
          ),
        )),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(36.0),
      color: Theme.of(context).splashColor,
    ),
    height: 44.0,
    width: MediaQuery.of(context).size.width,
  );
} else {
  return Container(
  child: Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Consumer<UpdateModel>(
          builder: (_, notifier, __) => Text(
            _pizzaSize,
            style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
          ),
        ),
      )),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8.0),
    color: Theme.of(context).splashColor,
  ),
  height: 44.0,
  width: MediaQuery.of(context).size.width,
);
}}

Widget _sliderAdaptive() {
    if(Platform.isAndroid) {
      return Consumer<UpdateModel>(
        builder: (_, notifier, __) => Slider(
          max: 2,
          divisions: 2,
          value: _currentVal,
          onChanged: (double value) {
            if (value == 0) {
              _pizzaSize = 'Маленькая';
              notifier.pizzaSizePrice = 200.0;
            } else if (value == 1) {
              _pizzaSize = 'Средняя';
              notifier.pizzaSizePrice = 350.0;
            } else {
              _pizzaSize = 'Большая';
              notifier.pizzaSizePrice = 500.0;
            }
            notifier.summa();
            _currentVal = value;
          },
        ),
      );
    } else {
      return Consumer<UpdateModel>(
      builder: (_, notifier, __) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Slider.adaptive(
          max: 2,
          divisions: 2,
          value: _currentVal,
          onChanged: (double value) {
            if (value == 0) {
              _pizzaSize = 'Маленькая';
              notifier.pizzaSizePrice = 200.0;
            } else if (value == 1) {
              _pizzaSize = 'Средняя';
              notifier.pizzaSizePrice = 350.0;
            } else {
              _pizzaSize = 'Большая';
              notifier.pizzaSizePrice = 500.0;
            }
            notifier.summa();
            _currentVal = value;
          },
        ),
      ),
    );
    }
}


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: _pizzaSizeContainer(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SliderTheme(
            data: const SliderThemeData(
              activeTickMarkColor: Colors.white,
              inactiveTickMarkColor: Color(0xFF0079D0),
              tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 2),
              thumbShape: RoundSliderThumbShape(
                elevation: 5,
                enabledThumbRadius: 5,
              ),
            ),
            child: _sliderAdaptive(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 57, 0, 0),
          child: Text(
            'Соус:',
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
          ),
        ),
      ],
    );
  }
}
