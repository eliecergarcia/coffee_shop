import 'package:coffee_shop/api/api.dart';
import 'package:coffee_shop/provider/coffe_provider.dart';
import 'package:coffee_shop/routes/routes.dart';
import 'package:coffee_shop/ui/views/products_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  CoffeeApi.configureDio();
  runApp(
    const AppState(),
  );
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => CoffeeProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      debugShowCheckedModeBanner: false,
      initialRoute: ProductsView.id,
      routes: customRoutes,
      theme: ThemeData.dark(),
    );
  }
}
