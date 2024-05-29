import 'dart:convert';

import 'package:application/models/product.dart';
import 'package:http/http.dart' as http;

class ProductHttpService {
  Future<List<Product>> getProducts() async {
    Uri url = Uri.parse(
        "https://lesson46-761b9-default-rtdb.firebaseio.com/products.json");

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<Product> loadProducts = [];

    if (data != null) {
      data.forEach((key, value) {
        loadProducts.add(Product.fromJson(value));
      });
    }

    return loadProducts;
  }
}
