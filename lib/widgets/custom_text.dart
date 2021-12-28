import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      required this.edgeInsets,
      required this.fontSize,
      required this.fontWeight})
      : super(key: key);

  final String text;
  final double edgeInsets;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edgeInsets),
      child: Text(
        text,
        style: GoogleFonts.roboto(
            textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        )),
      ),
    );
  }
}
