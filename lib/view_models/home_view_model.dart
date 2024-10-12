import 'package:coffee_shop_mobile_apps/utils/assets.dart';
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

  final List<CoffeeProduct> coffeeProducts = [
    CoffeeProduct(
      id: '1',
      productName: 'Macchiato',
      detail: 'Rich espresso topped with frothy milk.',
      price: 4.50,
      imageUrl: '${AssetPath.imagePath}/coffee-1.png',
      score: 4.5,
    ),
    CoffeeProduct(
      id: '2',
      productName: 'Latte',
      detail: 'Smooth espresso with steamed milk.',
      price: 4.00,
      imageUrl: '${AssetPath.imagePath}/coffee-2.png',
      score: 4.7,
    ),
    CoffeeProduct(
      id: '3',
      productName: 'Americano',
      detail: 'Espresso diluted with hot water.',
      price: 3.50,
      imageUrl: '${AssetPath.imagePath}/coffee-3.png',
      score: 4.3,
    ),
    CoffeeProduct(
      id: '4',
      productName: 'Americano',
      detail: 'Espresso diluted with hot water.',
      price: 3.50,
      imageUrl: '${AssetPath.imagePath}/coffee-4.png',
      score: 4.3,
    ),
    CoffeeProduct(
      id: '5',
      productName: 'Americano',
      detail: 'Espresso diluted with hot water.',
      price: 3.50,
      imageUrl: '${AssetPath.imagePath}/coffee-5.png',
      score: 4.3,
    ),
  ];

  void selectCoffee(CoffeeModel coffee) {
    selectedCoffee = coffee.name;
    notifyListeners();
  }
}
