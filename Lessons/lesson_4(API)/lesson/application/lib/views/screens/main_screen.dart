import 'package:application/controllers/product_controller.dart';
import 'package:application/models/product.dart';
import 'package:application/views/widgets/product_info.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ProductController productController = ProductController();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    isLoading = true;

    productController.getProducts().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.6,
                      mainAxisSpacing: 50,
                      crossAxisSpacing: 0),
                  children: [
                    for (Product i in productController.list)
                      ProductWidget(product: i)
                  ],
                )),
    );
  }
}
