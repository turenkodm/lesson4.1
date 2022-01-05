import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizza_app/update_model.dart';
import 'package:pizza_app/order_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        toggleableActiveColor: Colors.lightGreenAccent,
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        disabledColor: Colors.white,

      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        toggleableActiveColor: Colors.lightGreen,
        primaryColor: Colors.blue,
        cardColor: Colors.white,
        disabledColor: Colors.black54,

      ),
      home: ChangeNotifierProvider<UpdateModel>(create: (BuildContext context) => UpdateModel(),
      child:  const OrderPage()),
    );
  }
}