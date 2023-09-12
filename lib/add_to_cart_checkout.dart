import 'package:flutter/material.dart';
import 'checkout.dart';
import 'model/product.dart';

class AddToCartCheckout extends StatefulWidget {
  const AddToCartCheckout({super.key});

  @override
  _AddToCartCheckoutState createState() => _AddToCartCheckoutState();
}

class _AddToCartCheckoutState extends State<AddToCartCheckout> {
  final products = [
    Product(
        productName: "Iphone",
        productDescription: "this is apple  product",
        productPrice: 999),
    Product(
        productName: "Earbud",
        productDescription: "this is apple  product",
        productPrice: 299),
    Product(
        productName: "apple MacBook",
        productDescription: "this is apple  product",
        productPrice: 1499)
  ];
  List<Product> cart = <Product>[];

  void addProductToCart(Product product) => setState(() => cart.add(product));

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Add Product',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text("Cart Items"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CheckOut(checkoutProd: cart)));
                              },
                              child: const Text('CheckOut')),
                        ],
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: cart
                              .map((product) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.productName),
                                      Text(product.productPrice.toString()),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    child: Text('View Cart ${cart.length}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    title: Text(product.productName),
                    subtitle: Text(product.productDescription),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(product.productPrice.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 16)),
                        const SizedBox(width: 20),
                        ElevatedButton(
                            onPressed: () => addProductToCart(product),
                            child: const Text("Add to Cart")),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )));
}
