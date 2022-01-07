import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/update_model.dart';

class CustomGestureDetector extends StatelessWidget {
  const CustomGestureDetector(
      {Key? key,
      required this.doughPrice,
      required this.xAlign,
      required this.selectedDough,
      required this.align,
      required this.color,
      required this.doughText})
      : super(key: key);

  final double doughPrice;
  final double xAlign;
  final bool selectedDough;
  final double align;
  final Color color;
  final String doughText;

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<UpdateModel>(context);
    return GestureDetector(
      onTap: () {
        notifier.summa();
        notifier.doughPrice = doughPrice;
        notifier.xAlign = xAlign;
        notifier.selectedDough = selectedDough;
      },
      child: Align(
        alignment: Alignment(align, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Text(
            doughText,
            style: TextStyle(
              color: color,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
