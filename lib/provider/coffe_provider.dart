import 'dart:collection';

import 'package:coffee_shop/model/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeProvider extends ChangeNotifier {
  final List<Coffee> _coffees = [];
  final List<Coffee> _coffeeCartShop = [];
  double total = 0;

  UnmodifiableListView<Coffee> get coffees => UnmodifiableListView(_coffees);

  UnmodifiableListView<Coffee> get coffeeCartShop =>
      UnmodifiableListView(_coffeeCartShop);

  void addCoffee(Coffee coffee) {
    _coffees.add(coffee);
    notifyListeners();
  }

  void addCoffees(List<Coffee> coffeeList) {
    _coffees.clear();
    _coffees.addAll(coffeeList);
    _generateTotal();
    notifyListeners();
  }

  void deleteCoffee(Coffee coffee) {
    _coffeeCartShop.removeLast();
    _generateTotal();
    notifyListeners();
  }

  void addCoffeeShop(Coffee coffee) {
    _coffeeCartShop.add(coffee);
    _generateTotal();
    notifyListeners();
  }

  void _generateTotal() {
    total = _coffeeCartShop.length * 190;
  }
}
