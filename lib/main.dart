import 'package:flutter/material.dart';

import 'add_to_cart.dart';
import 'add_to_cart_checkout.dart';
import 'add_to_wishlist.dart';
import 'checkout.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commere Partical',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AddToCartCheckout());
  }
}
