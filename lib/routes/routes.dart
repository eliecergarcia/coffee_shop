import 'package:coffee_shop/ui/views/cart_shop_view.dart';
import 'package:coffee_shop/ui/views/products_view.dart';
import 'package:flutter/widgets.dart';

var customRoutes = <String, WidgetBuilder>{
  CartShopView.id: (_) => CartShopView(),
  ProductsView.id: (_) => ProductsView(),
};
