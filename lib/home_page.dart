import 'package:flutter/material.dart';

import 'model/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  List<Product> tempList = [];
  List<TextEditingController> controllers = [
    TextEditingController(), // Product Name
    TextEditingController(), // Product Description
    TextEditingController(), // Product Price
  ];

  void addProduct() {
    final product = Product(
      productName: controllers[0].text,
      productDescription: controllers[1].text,
      productPrice: double.parse(controllers[2].text),
    );
    setState(() => products.add(product));
    for (var controller in controllers) {
      controller.clear();
    }
  }

  void searchProduct({required String searchKey}) {
    setState(() {
      if (searchKey.isNotEmpty) {
        if (tempList.isEmpty) tempList = List.from(products);
        products = products
            .where((element) => element.productName
                .toLowerCase()
                .contains(searchKey.toLowerCase()))
            .toList();
      } else {
        products = List.from(tempList);
        tempList = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              const Text('Add Product',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              ...controllers
                  .map(
                    (controller) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.red),
                        ),
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: [
                              "Product Name",
                              "Product Description",
                              "Product Price"
                            ][controllers.indexOf(controller)],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              const SizedBox(height: 40),
              InkWell(
                onTap: addProduct,
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text('ADD PRODUCT',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text('All Products',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.blue)),
                child: TextField(
                  onChanged: (val) {
                    searchProduct(searchKey: val);
                  },
                  decoration: const InputDecoration(
                    hintText: "Search Product",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(products[index].productName),
                      subtitle: Text(products[index].productDescription),
                      trailing: Text(
                        products[index].productPrice.toStringAsFixed(2),
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
