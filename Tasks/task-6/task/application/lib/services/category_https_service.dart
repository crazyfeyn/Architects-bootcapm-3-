import 'dart:convert';
import 'package:application/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryHttpService {
  Future<List<Category>> getProducts() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/categories");

    final response = await http.get(url);
    final List<dynamic> data = jsonDecode(response.body);

    List<Category> loadProducts = [];

    if (data.isNotEmpty) {
      for (var item in data) {
        loadProducts.add(Category(name: item['name'], image: item['image']));
      }
    }

    return loadProducts;
  }
}
