import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({Key? key, required this.onPressed}) : super(key: key);

  final ButtonStyle _buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(42),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      textStyle: const TextStyle(fontSize: 16.0));
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 83.0),
      child: ElevatedButton(
        style: _buttonStyle,
        onPressed: onPressed,
        child: const Text('Заказать'),
      ),
    );
  }
}
