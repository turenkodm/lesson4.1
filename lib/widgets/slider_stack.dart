import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/util/constants.dart';
import 'package:provider/provider.dart';

import '../update_model.dart';

class SliderStack extends StatefulWidget {
  const SliderStack({Key? key}) : super(key: key);

  @override
  _SliderStackState createState() => _SliderStackState();
}

class _SliderStackState extends State<SliderStack> {
  double _currentVal = 1;
  String _pizzaSize = 'Средняя';
  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<UpdateModel>(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                _pizzaSize,
                style: const TextStyle(fontSize: 20, color: primaryColor),
              ),
            )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36.0),
              color: backgroundColor,
            ),
            height: 34.0,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
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
            child: Slider(
              max: 2,
              divisions: 2,
              value: _currentVal,
              onChanged: (double value) {
                setState(() {
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
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 47, 0, 0),
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
