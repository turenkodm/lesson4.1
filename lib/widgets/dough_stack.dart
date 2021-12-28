import 'package:flutter/material.dart';
import 'package:pizza_app/util/constants.dart';
import 'package:provider/provider.dart';

import '../update_model.dart';

class DoughStack extends StatefulWidget {
  const DoughStack({Key? key}) : super(key: key);

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
    final notifier = Provider.of<UpdateModel>(context);
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
            notifier.summa();
            notifier.doughPrice = 0.00;
            _xAlign = regularDoughAlign;
            _regularColor = selectedDoughColor;
            _thinColor = normalDoughColor;
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
            notifier.doughPrice = 100.0;
            notifier.summa();
            _xAlign = thinDoughAlign;
            _thinColor = selectedDoughColor;
            _regularColor = normalDoughColor;
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
}
