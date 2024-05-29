import 'package:application/controllers/product_controller.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final ProductController productsController;
  const ProductPage({required this.productsController, super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.productsController.getProducts(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Datas are not found'),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final products = snapshot.data;

          return products == null || products.isEmpty
              ? const Center(
                  child: Text('Datas are not found'),
                )
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: ((context, index) {
                    final product = products[index + 1];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(product.image),
                        Padding(
                          padding: const EdgeInsets.all(17),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                textAlign: TextAlign.start,
                                "\$${product.price}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 19),
                              ),
                              Text(product.description),
                              Text(
                                product.title,
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }));
        }));
  }
}
