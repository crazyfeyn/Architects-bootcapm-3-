import 'dart:convert';
import 'package:application/models/product.dart';
import 'package:http/http.dart' as http;

class ProductHttpService {
  Future<List<Product>> getProducts() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/products");

    final response = await http.get(url);
    final List<dynamic> data = jsonDecode(response.body);

    List<Product> loadProducts = [];

    if (data.isNotEmpty) {
      for (var item in data) {
        loadProducts.add(Product(
            title: item['title'],
            image: item['images'][0],
            description: item['description'],
            price: item['price'].toDouble()));
      }
    }

    return loadProducts;
  }
}
