import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../update_model.dart';

class DoughStack extends StatefulWidget {
  const DoughStack({Key? key}) : super(key: key);

  @override
  _DoughStackState createState() => _DoughStackState();
}

class _DoughStackState extends State<DoughStack> with RestorationMixin {
  RestorableInt currentSegment = RestorableInt(0);


  double _xAlign = 0;
  Color _regularColor = Colors.white;
  Color _thinColor = Colors.black54;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _regularColor = Colors.white;
      _thinColor = Colors.black54;
    });
    _xAlign = -1;

  }


  Widget _doughType(BuildContext context) {
    final notifier = Provider.of<UpdateModel>(context);

    if (Platform.isAndroid) {
      return Column(
        children: [
          const SizedBox(
            height: 33.0,
          ),
          Container(
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: Alignment(_xAlign, 0),
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  notifier.summa();
                  notifier.doughPrice = 0.00;
                  _xAlign = -1;
                  _regularColor = Theme.of(context).cardColor;
                  _thinColor = Theme.of(context).disabledColor;
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
                  _xAlign = 1;
                  _thinColor = Theme.of(context).cardColor;
                  _regularColor = Theme.of(context).disabledColor;
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





