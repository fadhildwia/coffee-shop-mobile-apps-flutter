import 'package:flutter/material.dart';
import '../models/coffee_model.dart';

class HomeViewModel extends ChangeNotifier {
  String? selectedCoffee = 'All Coffee';
  String? selectedLocation;

  final List<CoffeeModel> coffeeTypes = [
    CoffeeModel('All Coffee'),
    CoffeeModel('Macchiato'),
    CoffeeModel('Latte'),
    CoffeeModel('Americano'),
    CoffeeModel('Mocha'),
    CoffeeModel('Flat White'),
    CoffeeModel('Cold Brew'),
    CoffeeModel('Affogato'),
    CoffeeModel('Irish Coffee'),
  ];

  void selectCoffee(CoffeeModel coffee) {
    selectedCoffee = coffee.name;
    notifyListeners();
  }
}
