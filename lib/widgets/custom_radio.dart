import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/update_model.dart';
import 'package:provider/provider.dart';

import '../order_page.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    Key? key,
    required this.text,
    required this.sauce,
    required this.val,
    required this.subtitle,
  }) : super(key: key);
  final String text;
  final Sauce sauce;
  final Sauce? val;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<UpdateModel>(context);
    return Column(
      children: [
        RadioListTile<Sauce>(
          subtitle: Text(subtitle),
          activeColor: const Color(0xFF5DB075),
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(
            text,
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )),
          ),
          value: sauce,
          groupValue: val,
          onChanged: (Sauce? value) {
            if (value == Sauce.spicy) {
              notifier.saucePrice = 0.0;
            } else if (value == Sauce.sour) {
              notifier.saucePrice = 50.0;
            } else {
              notifier.saucePrice = 80;
            }
            notifier.summa();
            notifier.sauce = value!;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Container(
            height: 1,
            color: const Color(0xFFE8E8E8),
          ),
        ),
      ],
    );
  }
}
