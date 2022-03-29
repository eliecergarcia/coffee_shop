import 'package:coffee_shop/model/coffee.dart';
import 'package:coffee_shop/provider/coffe_provider.dart';
import 'package:coffee_shop/ui/shared/widgets/button_add_minus_cartshop.dart';
import 'package:coffee_shop/ui/shared/widgets/button_option.dart';
import 'package:coffee_shop/ui/views/cart_shop_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductsView extends StatefulWidget {
  static String id = 'products_view';

  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  Coffee coffeeChiapas = Coffee(
      id: 0,
      grind: 'Chiapas',
      price: 190,
      weight: 500,
      description: '',
      typeGrind: 'Molido Fino');
  Coffee coffeeVeracruz = Coffee(
      id: 1,
      grind: 'Veracruz',
      price: 190,
      weight: 500,
      description: '',
      typeGrind: 'Molido Fino');

  Coffee coffeePuebla = Coffee(
      id: 2,
      grind: 'Puebla',
      price: 190,
      weight: 500,
      description: '',
      typeGrind: 'Molido Fino');

  Coffee coffeeOaxaca = Coffee(
      id: 3,
      grind: 'Oaxaca',
      price: 190,
      weight: 500,
      description: '',
      typeGrind: 'Molido Fino');

  Coffee coffeeNayarit = Coffee(
      id: 3,
      grind: 'Nayarit',
      price: 190,
      weight: 500,
      description: '',
      typeGrind: 'Molido Fino');

  @override
  void initState() {
    Provider.of<CoffeeProvider>(context, listen: false).addCoffee(
      coffeeChiapas,
    );
    Provider.of<CoffeeProvider>(context, listen: false).addCoffee(
      coffeeVeracruz,
    );
    Provider.of<CoffeeProvider>(context, listen: false).addCoffee(
      coffeeOaxaca,
    );
    Provider.of<CoffeeProvider>(context, listen: false).addCoffee(
      coffeePuebla,
    );
    Provider.of<CoffeeProvider>(context, listen: false).addCoffee(
      coffeeNayarit,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final coffee = Provider.of<CoffeeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.xmark),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        CartShopView.id,
                      );
                    },
                    icon: const Icon(FontAwesomeIcons.cartShopping),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Cafés de Especialidad',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: Row(
                children: [
                  ButtonCategory(
                    title: 'Cafés',
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ButtonCategory(
                    title: 'Cafeteras',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(coffee.coffees.length, (index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    elevation: 10,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Flexible(
                              child: Image.network(
                                  'https://www.nutricienta.com/imagenes/alimentos/alimento-nutricienta-caf-en-grano.jpg'),
                            ),
                            Text(
                              coffee.coffees[index].grind!,
                            ),
                            Text(
                              coffee.coffees[index].typeGrind!,
                            ),
                            //Text(coffee.coffees[index].description!,),
                            Text('Cont. Net. ${coffee.coffees[index].weight}g'),
                            Text('\$${coffee.coffees[index].price!}0'),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ///Minus coffee product
                                ButtonAddMinusCarShop(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      coffee
                                          .deleteCoffee(coffee.coffees[index]);
                                    });

                                    ///SnackBar
                                    final snackBar = SnackBar(
                                      content:
                                          const Text('Producto Eliminado!'),
                                      action: SnackBarAction(
                                        label: '',
                                        onPressed: () {},
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),

                                ///Add coffee
                                ButtonAddMinusCarShop(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      coffee
                                          .addCoffeeShop(coffee.coffees[index]);
                                      print(coffee.coffeeCartShop.length);
                                    });
                                    final snackBar = SnackBar(
                                      content: const Text(
                                          'Producto Agregado al Carrito!'),
                                      action: SnackBarAction(
                                        label: 'Deshacer',
                                        onPressed: () {},
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
