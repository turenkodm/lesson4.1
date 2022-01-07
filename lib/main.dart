import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizza_app/update_model.dart';
import 'package:pizza_app/order_page.dart';
import 'package:pizza_app/util/theme.dart';
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
      darkTheme: darkTheme(),
      theme: lightTheme(),
      home: ChangeNotifierProvider<UpdateModel>(create: (BuildContext context) => UpdateModel(),
      child:  const OrderPage()),
    );
  }
}