import 'package:flutter/material.dart';
import 'model/product.dart';

class AddToWishList extends StatefulWidget {
  const AddToWishList({super.key});

  @override
  _AddToWishListState createState() => _AddToWishListState();
}

class _AddToWishListState extends State<AddToWishList> {
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
  List<Product> WishList = <Product>[];

  void addProductToWishList(Product product) =>
      setState(() => WishList.add(product));

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
                        title: const Text("WishList Items"),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: WishList.map((product) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.productName),
                                  Text(product.productPrice.toString()),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              )).toList(),
                        ),
                      ),
                    ),
                    child: Text('View WishList ${WishList.length}',
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
                            onPressed: () => addProductToWishList(product),
                            child: const Text("Add to WishList")),
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
