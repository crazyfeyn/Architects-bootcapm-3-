import 'package:application/controllers/category_controller.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final CategoryController categoryController;
  const CategoryPage({required this.categoryController, super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.categoryController.getProducts(),
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
          final categories = snapshot.data;

          return categories == null || categories.isEmpty
              ? const Center(
                  child: Text('Datas are not found'),
                )
              : ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: ((context, index) {
                    final category = categories[index + 1];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(category.image),
                        Padding(
                          padding: const EdgeInsets.all(17),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                textAlign: TextAlign.start,
                                "\$${category.name}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 19),
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
