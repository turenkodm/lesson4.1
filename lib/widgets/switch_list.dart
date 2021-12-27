import 'package:flutter/material.dart';

class SwitchList extends StatefulWidget {
  const SwitchList({Key? key}) : super(key: key);

  @override
  State<SwitchList> createState() => _SwitchListState();
}

class _SwitchListState extends State<SwitchList> {
  bool _addCheese = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Image.asset("assets/images/cheese.png"),
      ),
      title: const Text(
        'Дополнительный сыр',
        style: TextStyle(fontSize: 16.0, color: Color(0xFF263238)),
      ),
      value: _addCheese,
      onChanged: (bool value) {
        setState(() {
          _addCheese = value;
        });
      },
    );
  }
}
