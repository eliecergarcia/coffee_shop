import 'package:coffee_shop/provider/coffe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartShopView extends StatelessWidget {
  static String id = 'cart_shop_view';
  const CartShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _customTileExpanded = false;
    final coffee = Provider.of<CoffeeProvider>(context);
    coffee.generateTotal();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Carrito',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: Column(
          children: [
            Text(
              'Subtotal: \$${coffee.total}',
            ),
            const SizedBox(
              height: 10,
            ),
            coffee.coffeeCartShop.isEmpty
                ? const Text('No tienes productos en tu carrito')
                : Expanded(
                    child: ListView.builder(
                      itemCount: coffee.coffeeCartShop.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ExpansionTile(
                            title: Text(coffee.coffeeCartShop[index].grind!),
                            subtitle: Text(
                              "\$" +
                                  coffee.coffeeCartShop[index].price!
                                      .toString(),
                            ),
                            children: [
                              Text(
                                  'Contenido neto:${coffee.coffeeCartShop[index].weight!}g')
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Continuar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
