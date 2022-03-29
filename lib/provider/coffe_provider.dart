import 'package:coffee_shop/model/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeProvider extends ChangeNotifier {
  List<Coffee> coffees = [];
  List<Coffee> coffeeCartShop = [];
  double total = 0;

  ///add to list coffee
  addCoffee(Coffee coffee) {
    coffees.add(coffee);
  }

  addCoffees(List<Coffee> coffee) {
    coffees = coffee;
  }

  ///delete coffee
  deleteCoffee(Coffee coffee) {
    coffeeCartShop.removeLast();
    print(coffeeCartShop.length);
  }

  ///Add to cart shop
  addCoffeeShop(Coffee coffee) {
    coffeeCartShop.add(coffee);
  }

  ///Generate subtotal
  generateTotal() {
    total = coffeeCartShop.length * 190;
  }
}
