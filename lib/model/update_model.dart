

import 'package:flutter/material.dart';
import 'package:pizza_app/pages/order_page.dart';

class UpdateModel with ChangeNotifier {
  double sum = 0;
  double doughPrice = 0;
  double saucePrice = 0;
  double pizzaSizePrice = 350;
  double cheesePrice = 0;
  String text = '0.00';
  Sauce sauce = Sauce.spicy;
  bool addCheese = false;
  double xAlign = -1;
  bool selectedDough = false;

  double summa() {
    sum = doughPrice + saucePrice + pizzaSizePrice + cheesePrice;
    notifyListeners();
    return sum;
  }

}
