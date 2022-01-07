import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    required this.edgeInsets,
  }) : super(key: key);

  final String text;
  final double edgeInsets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edgeInsets),
      child: Text(
        text,
        style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.headline3),
      ),
    );
  }
}
