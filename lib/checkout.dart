import 'package:flutter/material.dart';

import 'model/product.dart';

class CheckOut extends StatelessWidget {
  final List<Product> checkoutProd;
  const CheckOut({required this.checkoutProd, super.key});

  double getTotalPrice() {
    double price = 0;
    for (var element in checkoutProd) {
      price = price + element.productPrice;
    }
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Center(
            child: Text('CheckOut Items',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, __) => const Divider(),
              itemCount: checkoutProd.length,
              itemBuilder: (context, index) {
                final product = checkoutProd[index];
                return ListTile(
                  title: Text(product.productName),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(product.productPrice.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 20),
                    ],
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: const Text('Total Price'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(getTotalPrice().toString(),
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 20),
              ],
            ),
          )
        ],
      )),
    );
  }
}
