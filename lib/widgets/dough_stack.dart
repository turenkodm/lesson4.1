import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/widgets/custom_gesture_detector.dart';
import 'package:provider/provider.dart';
import '../model/update_model.dart';

class DoughStack extends StatefulWidget {
  const DoughStack({Key? key}) : super(key: key);

  @override
  _DoughStackState createState() => _DoughStackState();
}

class _DoughStackState extends State<DoughStack> with RestorationMixin {
  RestorableInt currentSegment = RestorableInt(0);

  Widget _doughType(BuildContext context) {
    final notifier = Provider.of<UpdateModel>(context);

    if (Platform.isAndroid) {
      if (!notifier.selectedDough) {
        return Column(
          children: [
            const SizedBox(
              height: 33.0,
            ),
            Container(
              child: Stack(
                children: [
                  animatedAlign(notifier, context),
                  CustomGestureDetector(
                    doughPrice: 0.00,
                    xAlign: -1,
                    selectedDough: false,
                    align: -1,
                    color: Theme.of(context).cardColor,
                    doughText: 'Обычное тесто',
                  ),
                  CustomGestureDetector(
                    doughPrice: 100.00,
                    xAlign: 1,
                    selectedDough: true,
                    align: 1,
                    color: Theme.of(context).disabledColor,
                    doughText: 'Тонкое тесто',
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).splashColor,
                borderRadius: BorderRadius.circular(36.0),
              ),
            ),
            const SizedBox(
              height: 19.0,
            ),
          ],
        );
      } else {
        return Column(
          children: [
            const SizedBox(
              height: 33.0,
            ),
            Container(
              child: Stack(
                children: [
                  animatedAlign(notifier, context),
                  CustomGestureDetector(
                    doughPrice: 0.00,
                    xAlign: -1,
                    selectedDough: false,
                    align: -1,
                    color: Theme.of(context).disabledColor,
                    doughText: 'Обычное тесто',
                  ),
                  CustomGestureDetector(
                    doughPrice: 100.00,
                    xAlign: 1,
                    selectedDough: true,
                    align: 1,
                    color: Theme.of(context).cardColor,
                    doughText: 'Тонкое тесто',
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).splashColor,
                borderRadius: BorderRadius.circular(36.0),
              ),
            ),
            const SizedBox(
              height: 19.0,
            ),
          ],
        );
      }
    } else {
      const segmentedControlMaxWidth = 500.0;
      final children = <int, Widget>{
        0: const Text('Обычное тесто'),
        1: const Text('Тонкое тесто'),
      };

      void onValueChanged(int? newValue) {
        setState(() {
          if (newValue == 0) {
            notifier.doughPrice = 0.00;
            notifier.summa();
          } else if (newValue == 1) {
            notifier.doughPrice = 100.0;
            notifier.summa();
          }
          currentSegment.value = newValue!;
        });
      }

      return SizedBox(
        width: segmentedControlMaxWidth,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CupertinoSlidingSegmentedControl<int>(
            children: children,
            onValueChanged: onValueChanged,
            groupValue: currentSegment.value,
          ),
        ),
      );
    }
  }

  AnimatedAlign animatedAlign(UpdateModel notifier, BuildContext context) {
    return AnimatedAlign(
      alignment: Alignment(notifier.xAlign, 0),
      duration: const Duration(milliseconds: 200),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(36.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _doughType(context);
  }

  @override
  String get restorationId => 'cupertino_segment_control';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(currentSegment, 'current_segment');
  }
}
