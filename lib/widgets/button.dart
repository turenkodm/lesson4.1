import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  Button({Key? key, required this.onPressed}) : super(key: key);

  final ButtonStyle _buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(42),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)));
  final VoidCallback onPressed;

  Widget _buttonType() {
    if (Platform.isAndroid) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(83.0, 0, 83.0, 30),
        child: ElevatedButton(
          style: _buttonStyle,
          onPressed: onPressed,
          child: Text(
            'Заказать',
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(fontWeight: FontWeight.w500)),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(83.0, 0, 83.0, 30),
        child: CupertinoButton.filled(
          child: Text(
            'Заказать',
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(fontWeight: FontWeight.w500)),
          ),
          onPressed: onPressed,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buttonType();
  }
}
