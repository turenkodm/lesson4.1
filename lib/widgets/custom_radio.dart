import 'package:flutter/material.dart';

import '../order_page.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({
    Key? key,
    required this.text,
    required this.sauce,
    required this.val,
    required this.onChanged,
    required this.subtitle,
  }) : super(key: key);
  final String text;
  final Sauce sauce;
  final Sauce? val;
  final Function(Sauce?) onChanged;
  final String subtitle;

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

Sauce sauce = Sauce.spicy;

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<Sauce>(
          subtitle: Text(widget.subtitle),
          activeColor: const Color(0xFF5DB075),
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(widget.text),
          value: widget.sauce,
          groupValue: widget.val,
          onChanged: widget.onChanged,
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
