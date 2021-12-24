import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 88.0),
              child: Image(
                image: AssetImage('assets/images/img.png'),
              ),
            ),
            SizedBox(
              height: 33.0,
            ),
            Text(
              'Калькулятор пиццы',
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 9.0,
            ),
            Text(
              'Выберите параметры:',
              style: TextStyle(fontSize: 19.0),
            ),
            SizedBox(
              height: 33.0,
            ),
          ],
        ),
      ),
    );
  }
}
